import 'package:flutter/material.dart';
import 'package:food_app/Payment.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
	Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Payment()),
            );

},
      child: Container(
        width: 335,
        height: 51,
        decoration: BoxDecoration(
          color: const Color(0xFFFD8700),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            "Process to payment",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
