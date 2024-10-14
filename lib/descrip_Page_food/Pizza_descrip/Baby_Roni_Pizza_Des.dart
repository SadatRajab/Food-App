import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_cupit.dart';
import 'package:food_app/descrip_Page_food/style/decsrip_page.dart';

class Baby_Roni_Pizza_Des extends StatefulWidget {
  const Baby_Roni_Pizza_Des({super.key});

  @override
  State<Baby_Roni_Pizza_Des> createState() => _Baby_Roni_Pizza_DesState();
}

class _Baby_Roni_Pizza_DesState extends State<Baby_Roni_Pizza_Des> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCupit(),
      child: descrip_Page_food(
          imagePath: "lib/image/pizza/Pizza_Pepe.jpg",
          title: 'Pepperoni Pizza',
          description:
              'A classic pizza loaded with rich Italian flavors, featuring a thin and crispy crust covered with a tangy, spiced tomato sauce. Topped with thinly sliced, perfectly seasoned pepperoni that crisps up in the oven, and a generous layer of melted mozzarella cheese. Baked to perfection, the cheese melts over the spicy pepperoni, creating a perfect blend of heat and crunch in every bite.',
          Praic: 25),
    );
  }
}
