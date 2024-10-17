import 'package:flutter/material.dart';
import 'package:food_app/cart/widgets/app_bar.dart';
import 'package:food_app/cart/widgets/total_price_row.dart';

import '../widgets/cart_item_listview.dart';
import '../widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FBFF),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(),
            SizedBox(height: 40),
            Text('Your cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CartItemsListView(),
                  ),
                  TotalPriceRow(),
                  SizedBox(height: 20),
                  CustomButton()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
