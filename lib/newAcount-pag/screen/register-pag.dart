import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Home_page/screen/Home_page.dart';
import 'package:food_app/Style/Text_fild_Style.dart';
import 'package:food_app/newAcount-pag/register-Cuibt/register-cupit.dart';
import 'package:food_app/newAcount-pag/register-Cuibt/register-state.dart';
import 'package:google_fonts/google_fonts.dart';

class Register_pag extends StatefulWidget {
  Register_pag({super.key});

  @override
  State<Register_pag> createState() => _Register_pagState();
}

final _formKey = GlobalKey<FormState>();

// مفتاح للتأكد من صحة النموذج
final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

final TextEditingController nameController = TextEditingController();

final TextEditingController phonController = TextEditingController();
bool _obscureText = true;

class _Register_pagState extends State<Register_pag> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) => Register_cupit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                "lib/image/icon.png",
                fit: BoxFit.cover,
                width: 50,
              ),
              centerTitle: true,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>HomePage())
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFA5A1E),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xffFA5A1E)),
                    ))
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(right: 40),
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create an account",
                            style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 35),
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Welcome friend, enter your details so lets get started in ordering food.",
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      margin: EdgeInsets.only(top: 54),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 200),
                              child: Text(
                                "Email Address",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 350,
                              child: TextFormField(
                                controller: emailController,
                                decoration:
                                    customInputDecoration(hint: 'Enter email'),
                                validator: emailValidator,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 220),
                              child: Text(
                                "Password",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 350,
                              child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter Password",
                                    suffixIcon: IconButton(
                                      icon: Icon(_obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: _obscureText,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Password'; // رسالة خطأ إذا كان الحقل فارغ
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 240),
                              child: Text(
                                "Name",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 350,
                              child: TextFormField(
                                controller: nameController,
                                decoration:
                                    customInputDecoration(hint: 'Enter Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Name'; // رسالة خطأ إذا كان الحقل فارغ
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 240),
                              child: Text(
                                "Phone",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 350,
                              child: TextFormField(
                                controller: phonController,
                                decoration:
                                    customInputDecoration(hint: 'Enter Phone'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Phone'; // رسالة خطأ إذا كان الحقل فارغ
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    BlocListener<Register_cupit, RegisterState>(
                      listener: (BuildContext context, state) {
                        if (state is RegisterSucsess) {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>HomePage())
                        );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sucsess"),
                              backgroundColor: Color(0xDF49F436),
                            ),
                          );
                        }
                        if (state is RegisterFail) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("The Email and the Password Rpet"),
                              backgroundColor: Color.fromRGBO(244, 67, 54, 0.875),
                            ),
                          );
                        }
                      },
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
          
                            
                            BlocProvider.of<Register_cupit>(context).register(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phonController.text,
                            );
                          }
                        },
                        child: Text(
                          "Regist to my account",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFE554A),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
