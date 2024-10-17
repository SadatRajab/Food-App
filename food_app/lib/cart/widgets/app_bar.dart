import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFF8FBFF),
      leading: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
		Navigator.pop(context);
},
        ),
      ),
      title: const Column(
        children: [
          Text(
            'Delivery to',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
          ),
          Text(
            'lekki phase 1, Estate',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ],
      ),
      actions: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Image.asset('assets/images/persone.png'),
        ),
      ],
      centerTitle: true,
    );
  }
}
