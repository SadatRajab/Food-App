import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/DeliveryMethod.dart';
import 'package:food_app/Home_page/Cupit/food_cupit.dart';
import 'package:food_app/Home_page/style/food_Item.dart';
import 'package:food_app/descrip_Page_food/Pizza_descrip/Baby_Roni_Pizza_Des.dart';
import 'package:food_app/descrip_Page_food/Pizza_descrip/Shawarma_Pizza_De.dart';
import 'package:food_app/descrip_Page_food/Pizza_descrip/Vegetable_Pizza_Dec.dart';
import 'package:food_app/descrip_Page_food/Samosa_descrip/Beef_Shawarma_Dec.dart';
import 'package:food_app/descrip_Page_food/Samosa_descrip/Chicken_Shawarma_Dec.dart';
import 'package:food_app/descrip_Page_food/Samosa_descrip/Taco_Dec.dart';
import 'package:food_app/descrip_Page_food/Sausage_descrip/Sausage_Dec.dart';
import 'package:food_app/descrip_Page_food/burger_descrip/Mid_Cheese_Burger.dart';
import 'package:food_app/descrip_Page_food/burger_descrip/Big_Cheese_Burger.dart';
import 'package:food_app/descrip_Page_food/burger_descrip/small_Cheese_Burger.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int select = 0;
  List<String> Icon_food = ["🍕", '🍔', '🌭', '🌮'];
  List<String> categories = ['Pizza', 'Burger', 'Sausage', 'Samosa'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Color(0xffF8FBFF),
          appBar: AppBar(
            leading: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Color(0xffFE554A),
                ),
              ),
            ),
            title: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Food Page",
                style: TextStyle(fontSize: 24, color: Color(0xffFE554A)),
              ),
            ),
            centerTitle: true,
            actions: [
              Container(
                  margin: EdgeInsets.all(20),
                  width: 50,
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 35,
                  ))
            ],
          ),
          body: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 42, right: 70),
                  child: Text(
                    "Enjoy Delicious food",
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  )),
              SizedBox(
                height: 30,
              ),
              /*-----------Start Bar for Choose for food------------------------- */
              Container(
                height: 135,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<FoodCubit>()
                            .selectCategory(FoodCategory.values[index]);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 82,
                          height: 115,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: context.watch<FoodCubit>().state ==
                                        FoodCategory.values[index]
                                    ? Colors.green
                                    : Colors.grey,
                                width: 2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: context.watch<FoodCubit>().state ==
                                          FoodCategory.values[index]
                                      ? Color.fromARGB(202, 201, 251, 201)
                                      : Color(0xffF8FBFF),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Icon_food[index],
                                    style: TextStyle(fontSize: 27),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    categories[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: context.watch<FoodCubit>().state ==
                                              FoodCategory.values[index]
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              /*-----------End Bar for Choose for food------------------------- */
              SizedBox(
                height: 50,
              ),
              /*-----------عرض الأكل بناءً على الاختيار------------------------- */
              BlocBuilder<FoodCubit, FoodCategory>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        if (state == FoodCategory.Burger) ...[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Big_Cheese_Burger())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: "lib/image/burger/large-Burger.png",
                                description:
                                    'No 10 opp lekki phase 1 bridge in sangotedo estate',
                                title: 'Big cheese burger'),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Mid_Cheese_Burger())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: 'lib/image/burger/Mediam_Burger.jpg',
                                title: 'Medium cheese ',
                                description:
                                    'No 10 opp lekki phase 1 bridge in sangotedo estate'),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Smal_Cheese_Burger())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: "lib/image/burger/smaller_Burger.png",
                                title: 'Small cheese',
                                description:
                                    'No 10 opp lekki phase 1 bridge in sangotedo estate'),
                          ),
                        ] else if (state == FoodCategory.Pizza) ...[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Baby_Roni_Pizza_Des())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: 'lib/image/pizza/Pizza_Pepe.jpg',
                                title: 'Baby Roni Pizza',
                                description:
                                    'A delicious pizza topped with thin slices of pepperoni'),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Shawarma_Pizza_Dec())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: "lib/image/pizza/Pizza_Shwarma.jpg",
                                title: 'Shawarma Pizza',
                                description:
                                    'Perfectly grilled and seasoned meat'),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Vegetable_Pizza_Dec())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: 'lib/image/pizza/Pizza_vijpg.jpg',
                                title: 'Vegetables Pizza',
                                description:
                                    'A mix of fresh and crispy vegetables served as a colorful'),
                          )
                        ] else if (state == FoodCategory.Sausage)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Sausage_Dec())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: 'lib/image/Sausage/sausage_clasic.jpg',
                                title: 'Sausage',
                                description:
                                    ' A perfectly grilled sausage slice served in fresh bread'),
                          )
                        else if (state == FoodCategory.Samosa) ...[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Taco_Dec())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: 'lib/image/Samosa/Samosa_clasic.png',
                                title: "Samosa",
                                description:
                                    'A golden crispy bread filled with a mixture of ground meat '),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Beef_Shawarma_Dec())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: 'lib/image/Samosa/Shawarma_meet.png',
                                title: 'Beef Shawarma',
                                description:
                                    "Perfectly seasoned and grilled meat, sliced thinly"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Chicken_Shawarma_Dec())
                              );
                            },
                            child: buildFoodItem(
                                imagePath: "lib/image/Samosa/Shawarma.jpg",
                                title: 'Chicken Shawarma',
                                description:
                                    'Well-seasoned grilled chicken pieces served with fresh bread '),
                          )
                        ]
                      ],
                    ),
                  );
                },
              ),
              /*-----------End عرض الأكل بناءً على الاختيار------------------------- */
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            
            items: [
              BottomNavigationBarItem(
                
                icon: Icon(
                  Icons.home_outlined,),
                  label: 'Home'
                  ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search'
                  ),
              BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>Delivery())
                      );
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                  label: 'Cart'
                  ),
            ],
            selectedItemColor: Color(0xffFE554A),
            unselectedItemColor: Colors.grey,
            currentIndex: select,
            onTap: (index) {
              setState(() {
                select = index;
              });
            },
          ),
        );
      }),
    );
  }
}
