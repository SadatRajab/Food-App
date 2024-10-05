import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Login_Page/Auth_Cupit/Login-cupit.dart';
import 'package:food_app/Login_Page/screen/Login_scren.dart';


void main() {
  runApp(
    MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: LoginScren(),
      ),
    );
  }
}
