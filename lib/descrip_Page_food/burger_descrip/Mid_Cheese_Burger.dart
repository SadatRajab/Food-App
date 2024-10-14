import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Mid_Cheese_Burger extends StatefulWidget {
  const Mid_Cheese_Burger({super.key});

  @override
  State<Mid_Cheese_Burger> createState() => _Mid_Cheese_BurgerState();
}

class _Mid_Cheese_BurgerState extends State<Mid_Cheese_Burger> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/burger/Mediam_Burger.jpg",
          title: 'Mid Cheese burger',
          description:
              'This medium-sized burger doesn’t compromise on taste and quality. A perfectly grilled medium beef patty offers a balance of juiciness and flavor, topped with melted cheese, fresh lettuce, tomato slices, and crispy pickles. Served in a toasted soft bun with ketchup and mustard, it delivers a delightful blend of traditional flavors that satisfy all taste buds.',
          Praic: 15),
    );
  }
}
