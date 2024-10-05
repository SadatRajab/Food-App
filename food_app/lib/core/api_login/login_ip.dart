
import 'package:dio/dio.dart';
import 'package:food_app/model/Login_model.dart';

class LoginIp{
  final Dio _dio=Dio();
  Future <User_model> login(
    {
      required String email,
      required String password,
    }
  )async{
    final response=await _dio.post(
      "https://student.valuxapps.com/api/login",
      data:{
        'email':email,
        'password':password,
      }
      );
      User_model userLogin_model=
        User_model.fromJson(response.data['data']);
      return userLogin_model;
  }
}