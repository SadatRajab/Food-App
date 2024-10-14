import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Login_Page/Auth_Cupit/Login-cupit.dart';
import 'package:food_app/get_started_page/screens/get_started_screen.dart';


void main() {
  runApp(
    const MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
    );
  }
}
