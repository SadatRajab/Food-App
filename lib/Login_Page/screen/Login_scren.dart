import 'package:flutter/material.dart';
import 'package:food_app/Home_page/screen/Home_page.dart';
import 'package:food_app/Login_Page/Auth_Cupit/Login-cupit.dart';
import 'package:food_app/Login_Page/Auth_Cupit/Login-state.dart';
import 'package:food_app/Style/Text_fild_Style.dart';
import 'package:food_app/newAcount-pag/screen/register-pag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScren extends StatefulWidget {
  const LoginScren({super.key});
  @override
  State<LoginScren> createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  final _formKey = GlobalKey<FormState>(); 

 // مفتاح للتأكد من صحة النموذج
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "lib/image/icon.png",
            fit: BoxFit.cover,
            width: 50,
            ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>const HomePage()),
                );
              }, 
              child:const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20, 
                  color: Color(0xffFA5A1E),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xffFA5A1E)
                  ),
                )
              )
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
                  child:  Column(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      Text(
                        "Login to your account",
                        style: GoogleFonts.dmSans(
                          textStyle: 
                          TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:15 ,left: 35),
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Good to see you again, enter your details below to continue ordering.",
                        ),
                      )
                    ],),
                ),
                Container(
                  height: 255,
                  margin: EdgeInsets.only(top: 54),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text(
                            "Email Address",
                            style: GoogleFonts.poppins(
                            ),
                            ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 350,
                          child: TextFormField(
                            controller: emailController,
                            decoration: customInputDecoration(hint: 'Enter email'),
                            validator: emailValidator,
                          ),
                        ),
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(right: 220),
                          child: Text(
                            "Password",
                            style: GoogleFonts.poppins(
                            ),
                            ),
                        ),
                        SizedBox(height: 10,),
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
                                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                            obscureText: _obscureText,
                            validator : (value)
                            {if (value == null || value.isEmpty) {
                              return 'Please enter your Password'; // رسالة خطأ إذا كان الحقل فارغ
                              }
                            return null;
                            })
                          ),
                        
                    ],),
                    ),
                ),
                SizedBox(height: 220,),
                //*--------Bottom Creat Account
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF9881F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    onPressed:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: 
                        (context) => Register_pag())
                      );
                    } ,
                    child: Text(
                      "Create an account",
                      style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,)
                    ),
                  ),
                ),
      
                BlocListener <LoginCubit , LoginState>(
                  listener:(context , state){
                    if(state is loginSucsess){
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
                    if(state is loginFail){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("The Email and the Password incorrect"),
                          backgroundColor: Color.fromRGBO(244, 67, 54, 0.875),
                          )
                      );
                    }
                  },
                  child: Container(
                    child: TextButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          BlocProvider.of<LoginCubit>(context).login(
                            email:emailController.text, 
                            password: passwordController.text);
                        }
                      },
                      child:Text(
                        "Login to my account",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFE554A),
                          
                        ),
                        ) ,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


