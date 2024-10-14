import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Beef_Shawarma_Dec extends StatefulWidget {
  const Beef_Shawarma_Dec({super.key});

  @override
  State<Beef_Shawarma_Dec> createState() => _Beef_Shawarma_DecState();
}

class _Beef_Shawarma_DecState extends State<Beef_Shawarma_Dec> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/Samosa/Shawarma_meet.png",
          title: 'Beef Shawarma',
          description:
              'The classic shawarma combines thin slices of beef or lamb grilled on a vertical spit, seasoned with a special blend of Middle Eastern spices for a tender and flavorful bite. The meat is served inside fresh Arabic bread, along with tahini sauce, tomatoes, onions, and pickles. This combination balances rich, savory flavors with sharp, tangy accents, creating a satisfying meal for meat lovers.',
          Praic: 25),
    );
  }
}
