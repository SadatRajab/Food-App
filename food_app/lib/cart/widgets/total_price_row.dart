import 'package:flutter/material.dart';

class TotalPriceRow extends StatelessWidget {
  const TotalPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          Text('\$ 71.97',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
