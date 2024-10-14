import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Chicken_Shawarma_Dec extends StatefulWidget {
  const Chicken_Shawarma_Dec({super.key});

  @override
  State<Chicken_Shawarma_Dec> createState() => _Chicken_Shawarma_DecState();
}

class _Chicken_Shawarma_DecState extends State<Chicken_Shawarma_Dec> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/Samosa/Shawarma.jpg",
          title: 'Chicken Shawarma',
          description:
              ' A lighter, flavorful option for shawarma lovers, featuring thin slices of grilled chicken marinated in a blend of Eastern spices such as cumin, coriander, and paprika. The chicken is served in soft bread along with fresh toppings like tomatoes, pickles, and onions, and finished with a creamy garlic sauce. This combination delivers a delicious, savory experience in every bite, offering a lighter yet equally satisfying shawarma meal.',
          Praic: 25),
    );
  }
}
