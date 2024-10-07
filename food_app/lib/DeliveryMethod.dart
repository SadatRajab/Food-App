import 'package:flutter/material.dart';
import 'package:project/Completed.dart';
import 'Payment.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  TextEditingController AddressControler = TextEditingController();
  TextEditingController PhoneControler = TextEditingController();
  bool PayOn = false;
  String Address = "Enter Your address";
  String Phone = "Enter your phone";
  int Subtotal = 520;
  int? Total;
  String? payment;
  bool IsMasterCard = false;
  bool IsPayPal = false;
  bool IsStripe = false;
  bool Add_Phone = false;
  @override
  void initState() {
    super.initState();
    Total = Subtotal + 20;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Delivery Method",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: AddressControler,
                decoration:
                    const InputDecoration(hintText: 'Enter your address'),
              ),
              TextFormField(
                controller: PhoneControler,
                decoration: const InputDecoration(hintText: 'Enter your Phone'),
              ),
              const Text(
                "Payment",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    //mastercard
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: IsMasterCard
                                ? const Color(0xffF9881F)
                                : Colors.white)),
                    width: 75,
                    height: 75,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            IsStripe = false;
                            IsPayPal = false;
                            IsMasterCard = !IsMasterCard;
                            PayOn = false;
                          });
                          if (IsMasterCard == true) {
                            payment = "MasterCard";
                          } else if (IsMasterCard == false) payment = null;
                        },
                        child: Image.asset("images/mastercard.png")),
                  ),
                  Container(
                    //paypal
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: IsPayPal
                                ? const Color(0xffF9881F)
                                : Colors.white)),
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            IsMasterCard = false;
                            IsStripe = false;
                            IsPayPal = !IsPayPal;
                            PayOn = false;
                          });
                          if (IsPayPal == true) {
                            payment = "PayPal";
                          } else if (IsPayPal == false) payment = null;
                        },
                        child: Image.asset("images/paypal.png")),
                  ),
                  Container(
                    //stripe
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: IsStripe
                                ? const Color(0xffF9881F)
                                : Colors.white)),
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            IsMasterCard = false;
                            IsPayPal = false;
                            IsStripe = !IsStripe;
                            PayOn = false;
                          });
                          if (IsStripe == true) {
                            payment = "Stripe";
                          } else if (IsStripe == false) payment = null;
                        },
                        child: Image.asset("images/stripe.png")),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    //pay on arrival
                    width: double.infinity,
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            IsMasterCard = false;
                            IsStripe = false;
                            IsPayPal = false;
                            PayOn = !PayOn;
                            payment = null;
                          });
                        },
                        icon: PayOn
                            ? const Icon(Icons.circle)
                            : const Icon(Icons.circle_outlined),
                      ),
                      const Text(
                        "Pay on arrival",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ]),
                  ),
                  const Text(
                    "     Pay with cash/POS upon arrival",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Column(
                //Total
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee", style: TextStyle(fontSize: 20)),
                      Text("\$20", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Subtotal", style: TextStyle(fontSize: 20)),
                      Text("\$$Subtotal", style: const TextStyle(fontSize: 20))
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total", style: TextStyle(fontSize: 20)),
                      Text("\$$Total", style: const TextStyle(fontSize: 20))
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffF9881F),
                    ),
                    onPressed: () {
                      if (PhoneControler.text == '' ||
                          AddressControler.text == '') {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text(
                                          "Please enter your address and phone")));
                            });
                      } else if (payment != null || PayOn == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PayOn
                                    ? const CompletedOrder()
                                    : Payment(payment: payment)));
                      } else if (payment == null && PayOn == false) {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text("Please use a way to pay")));
                            });
                      }
                    },
                    child: PayOn
                        ? const Text(
                            "Complete Order",
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            "Proceed to Payment",
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
