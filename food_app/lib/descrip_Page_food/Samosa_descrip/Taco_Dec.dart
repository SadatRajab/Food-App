import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Taco_Dec extends StatefulWidget {
  const Taco_Dec({super.key});

  @override
  State<Taco_Dec> createState() => _Taco_DecState();
}

class _Taco_DecState extends State<Taco_Dec> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/Samosa/Samosa_clasic.png",
          title: 'Taco',
          description:
              'A traditional Mexican dish that combines crunchiness with rich, bold flavors. A crispy tortilla is filled with seasoned ground beef or grilled chicken, along with fresh toppings like shredded lettuce, diced tomatoes, and grated cheese. It’s served with salsa or creamy guacamole to add a refreshing and spicy kick, making it a perfect light and flavorful meal.',
          Praic: 25),
    );
  }
}
