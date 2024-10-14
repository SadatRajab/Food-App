import 'package:flutter/material.dart';
import 'package:food_app/DeliveryMethod.dart';
import 'package:food_app/Home_page/screen/Home_page.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title : IconButton(onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (context) => const Delivery(),
                )
              );
            },icon: const Icon(Icons.arrow_back),
            )),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("lib/image/Group 457.png"),
              const Text(
                "Your order has been\nsuccessfully placed",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "   Sit and relax while your orders is being \nworked on . It’ll take 5min before you get it",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 350,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffF9881F)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text(
                      "Go Back to home",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
