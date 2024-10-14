import 'package:flutter/material.dart';
import 'package:food_app/Login_Page/screen/Login_scren.dart';
import 'package:food_app/get_started_page/helper/models/build_context_extensions.dart';
import 'package:food_app/get_started_page/widgets/create_account_button.dart';
import 'package:food_app/get_started_page/widgets/on_boarding_widget.dart';
import 'package:food_app/newAcount-pag/screen/register-pag.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            "lib/image/icon.png",
            fit: BoxFit.cover,
            width: 50,
            ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 10),
            child: TextButton(
              onPressed: (){
                context.push(
                  const LoginScren(),
                );
              }, 
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20, 
                  color: Color(0xffFA5A1E),
                  fontWeight: FontWeight.bold,
                  decorationColor: Color(0xffFA5A1E)
                  ),
                )
              ),
          )
        ],
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // top space
            const SizedBox(height: 35,),

            // onboarding slidar widget
            const Expanded(
              child: OnBoardingWidget(),
            ),

            // space between
            const SizedBox(height: 55,),

            // create account button
            CreateAccountButton(
              width: MediaQuery.of(context).size.width,
              height: 65,
              onClick: (){
                context.push(
                  Register_pag(),
                );
              },
            ),

            // space between
            const SizedBox(height: 35,),

            // login text button
            TextButton(
              onPressed: (){
                context.push(
                  const LoginScren()
                );
              },
              child: const Text(
              'login',
                style: TextStyle(
                  fontSize: 20, 
                  color: Color(0xffFA5A1E),
                  decorationColor: Color(0xffFA5A1E),
                ),
              ),
            ),

            // bottom space
            const SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}