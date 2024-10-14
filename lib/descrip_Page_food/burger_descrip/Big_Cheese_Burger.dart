import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Big_Cheese_Burger extends StatefulWidget {
  const Big_Cheese_Burger({super.key});

  @override
  State<Big_Cheese_Burger> createState() => _Big_Cheese_BurgerState();
}

class _Big_Cheese_BurgerState extends State<Big_Cheese_Burger> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/burger/large-Burger.png",
          title: 'Big Cheese burger',
          description:
              'A gourmet burger featuring a large patty that guarantees a satisfying and flavorful meal. It consists of a fresh beef patty grilled to perfection, locking in all its juices. Layers of melted cheddar cheese are added for extra richness, along with fresh tomato slices, crispy lettuce, and sweet red onion. Served in a soft bun spread with mayonnaise and smoky barbecue sauce, it creates a perfect balance of sweetness and char. You can also add crispy bacon slices or mashed avocado for an even more enhanced taste.',
          Praic: 25),
    );
  }
}
