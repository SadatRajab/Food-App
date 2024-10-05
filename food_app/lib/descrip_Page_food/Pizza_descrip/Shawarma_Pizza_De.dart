import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Shawarma_Pizza_Dec extends StatefulWidget {
  const Shawarma_Pizza_Dec({super.key});

  @override
  State<Shawarma_Pizza_Dec> createState() => _Shawarma_Pizza_DecState();
}

class _Shawarma_Pizza_DecState extends State<Shawarma_Pizza_Dec> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/pizza/Pizza_Shwarma.jpg",
          title: 'Shawarma Pizza',
          description:
              'A delightful fusion of Italian and Middle Eastern flavors. The thin pizza crust is topped with either tomato sauce or garlic sauce, followed by tender shawarma slices marinated in a rich blend of spices. Melted mozzarella cheese is added along with fresh vegetables such as tomatoes, onions, and bell peppers. Baked until the crust is crispy and the flavors meld together, this pizza offers a unique and satisfying taste experience.',
          Praic: 25),
    );
  }
}
