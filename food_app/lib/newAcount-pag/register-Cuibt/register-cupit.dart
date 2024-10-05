import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/api-regs/regs-ip.dart';
import 'package:food_app/model/Login_model.dart';
import 'package:food_app/newAcount-pag/register-Cuibt/register-state.dart';

class Register_cupit extends Cubit<RegisterState> {
  Register_cupit() : super(RegisterInitial());

  late User_model getUser;

  register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      emit(RegisterLoding());
      getUser = await Regs_Ip()
          .regest(name: name, email: email, password: password, phone: phone);
      emit(RegisterSucsess());
    } on DioException catch (e) {
      emit(RegisterFail());
    } catch (e) {
      emit(RegisterFail());
    }
  }
}
