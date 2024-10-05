import 'package:dio/dio.dart';
import 'package:food_app/model/Login_model.dart';

class Regs_Ip{

  final Dio _dio=Dio();

  Future <User_model> regest(
    {
      required String name,
      required String email,
      required String password,
      required String phone,
    }
  )async{
    final response=await _dio.post(
      "https://student.valuxapps.com/api/register",
      data:{
        'name':name,
        'phone':phone,
        'email':email,
        'password':password,
      }
      );
      User_model userLogin_model=
        User_model.fromJson(response.data['data']);
      return userLogin_model;
  }
}