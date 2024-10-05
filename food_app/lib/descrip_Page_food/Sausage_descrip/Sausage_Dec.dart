import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Sausage_Dec extends StatefulWidget {
  const Sausage_Dec({super.key});

  @override
  State<Sausage_Dec> createState() => _Sausage_DecState();
}

class _Sausage_DecState extends State<Sausage_Dec> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/Sausage/sausage_clasic.jpg",
          title: 'Sausage',
          description:
              'A delicious sausage sandwich offering rich flavors and a crispy texture. The sausage is either grilled to a smoky perfection or fried to retain all its juiciness. Served in a soft, slightly toasted bun, it comes with a generous topping of ketchup and mustard. Adding fried onions or crispy pickles creates a balance between crunch and sweetness, making it a perfect light meal.',
          Praic: 25),
    );
  }
}
