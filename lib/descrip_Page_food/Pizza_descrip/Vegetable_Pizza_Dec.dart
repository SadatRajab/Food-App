import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Vegetable_Pizza_Dec extends StatefulWidget {
  const Vegetable_Pizza_Dec({super.key});

  @override
  State<Vegetable_Pizza_Dec> createState() => _Vegetable_Pizza_DecState();
}

class _Vegetable_Pizza_DecState extends State<Vegetable_Pizza_Dec> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/pizza/Pizza_vijpg.jpg",
          title: 'Vegetable Pizza',
          description:
              'A vibrant, vegetarian pizza full of fresh, natural flavors. It features a crispy, thin crust topped with a rich tomato sauce and a variety of fresh vegetables such as red and green bell peppers, tomatoes, black olives, and spinach. A generous layer of melted mozzarella cheese brings all the ingredients together, making it a perfect healthy and flavorful option for veggie lovers.',
          Praic: 25),
    );
  }
}
