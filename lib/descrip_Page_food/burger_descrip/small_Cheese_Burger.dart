import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Smal_Cheese_Burger extends StatefulWidget {
  const Smal_Cheese_Burger({super.key});

  @override
  State<Smal_Cheese_Burger> createState() => _Smal_Cheese_BurgerState();
}

class _Smal_Cheese_BurgerState extends State<Smal_Cheese_Burger> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/burger/smaller_Burger.png",
          title: 'Small Cheese burger',
          description:
              'A small-sized burger packed with flavor, ideal for a light snack or a side dish at a BBQ party. It features a small, well-grilled patty with a smoky flavor, topped with melted cheese, fresh pickles, and crisp lettuce. It’s served in a small, lightly toasted bun and can be garnished with onion slices and barbecue sauce or ketchup for an extra touch of sweetness.',
          Praic: 10),
    );
  }
}
