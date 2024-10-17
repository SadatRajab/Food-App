import 'package:flutter/material.dart';
import 'package:food_app/cart/widgets/cart_item.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const CartItem(),
      itemCount: 3,
    );
  }
}
