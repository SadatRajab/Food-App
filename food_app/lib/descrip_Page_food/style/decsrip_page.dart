import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/Home_page/screen/Home_page.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_state.dart';
import 'package:google_fonts/google_fonts.dart';

Widget descrip_Page_food({
  required String imagePath,
  required String title,
  required String description,
  required int Praic,
}) {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              /*---------- img Food---------------- */
              Container(
                  margin: EdgeInsets.only(top: 70),
                  width: 270,
                  height: 245,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ]),
                  child: Image.asset(imagePath)),
              BlocBuilder<CountCupit, Counter_States>(
                  builder: (BuildContext context, state) {
                CountCupit cupit = CountCupit.get(context);
                return Container(
                  margin: EdgeInsets.only(top: 35),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xffF9881F),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: () {
                              cupit.decreasNumber();
                            },
                            onLongPress: (){
                              cupit.ZeroNumber();
                            },
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                      Text(
                        "${cupit.num}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Container(
                        child: TextButton(
                            onPressed: () {
                              cupit.increasNumber();
                            },
                            
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                );
              }),
              Container(
                margin: EdgeInsets.only(top: 35),
                width: 290,
                height: 80,
                child: Column(
                  children: [
                    /*-------------- Name Food ----------------- */
                    Text(
                      title,
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 255,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffF5A62E),
                                ),
                                Text("  4+")
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [Text('🔥'), Text("  300cal")],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [Text('⏰'), Text("  5-10min")],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /*----------Descrpisn Food------------------*/
              Container(
                margin: EdgeInsets.only(top: 15),
                width: 320,
                height: 155,
                child: Text(description),
              ),
              Container(
                margin: EdgeInsets.only(top: 27),
                width: double.infinity,
                height: 57,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text(
                            'Price: \$${Praic}',
                            style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                          /*----Price------- */
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 40),
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffF9881F),
                          borderRadius: BorderRadius.circular(27)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Add Card",
                          style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  );
}
