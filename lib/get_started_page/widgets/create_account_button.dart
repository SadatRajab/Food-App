import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountButton extends StatelessWidget{
  final double height;
  final double width;
  final void Function() onClick;
  const CreateAccountButton({super.key,required this.onClick,this.width = 350,this.height = 50});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xfff9881f),
              Color(0xffff774c),
            ]
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Create an account',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}