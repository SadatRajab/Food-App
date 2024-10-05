
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:food_app/Login_Page/Auth_Cupit/Login-state.dart';
import 'package:food_app/model/Login_model.dart';
import 'package:food_app/core/api_login/login_ip.dart';

class LoginCubit extends Cubit <LoginState>{
  LoginCubit() : super(LoginInitial());

  late User_model user;

  login({
    required String email,
    required String password,
  })async{
    try
    {
      emit(loginLoding());
      user = await LoginIp().login(email: email,password: password);
      emit(loginSucsess());
    }
    on DioException catch(e){
      emit(loginFail());
    }
    catch(e){
      emit(loginFail());
    }
  }
}