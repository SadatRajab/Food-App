import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter = 1;
  double _dragExtent = 0;
  bool isSwiped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            if (details.primaryDelta! < 0) {
              _dragExtent += details.primaryDelta!;
              if (_dragExtent <= -100) {
                isSwiped = true;
              }
            }
            if (details.primaryDelta! > 0 && isSwiped) {
              _dragExtent += details.primaryDelta!;
              if (_dragExtent >= 0) {
                isSwiped = false;
                _dragExtent = 0;
              }
            }
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            if (_dragExtent > -100 && !isSwiped) {
              _dragExtent = 0;
            } else if (_dragExtent <= -100) {
              _dragExtent = -100;
              isSwiped = true;
            }
          });
        },
        child: Stack(
          children: [
            buildSlideBackground(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              transform: Matrix4.translationValues(_dragExtent, 0, 0),
              curve: Curves.easeInOut,
              child: buildCartItem(),
            ),
          ],
        ),
      ),
    );
  }

  // Build background with edit and delete buttons
  Widget buildSlideBackground() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(right: 5, top: 30),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.green),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit item action')),
                  );
                },
              ),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(right: 10, top: 30),
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Delete item action')),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Build the cart item foreground
  Widget buildCartItem() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/food.png',
            height: 50,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Macdonalds',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  'Classic cheesburger',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 4),
                Text(
                  '\$23.99',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline,
                        color: Colors.orange),
                    onPressed: () {
                      setState(() {
                        if (counter > 1) counter--;
                      });
                    },
                  ),
                  Text(counter.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline,
                        color: Colors.orange),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
