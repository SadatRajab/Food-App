import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildFoodItem({required String imagePath,required String title,  required String description}) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: 260,
      width: 200,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(2, 2),
                blurRadius: 7,
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 170,
              height: 112,
              margin: EdgeInsets.all(15),
              child: Image.asset(imagePath)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              description,
              style: GoogleFonts.dmSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                  Text("4.5", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
            ],
          )
        ],
      ),
    );
    
  }
