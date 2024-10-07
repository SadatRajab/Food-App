import 'package:flutter/material.dart';
import 'package:project/Completed.dart';

// ignore: must_be_immutable
class Payment extends StatefulWidget{
  String? payment ;
  Payment({super.key, required this.payment});
  @override
  State<Payment> createState() => _PaymentState();
}
class _PaymentState extends State<Payment> {

  TextEditingController CardDetailsControl = TextEditingController();
  TextEditingController DateControl = TextEditingController();
  TextEditingController CVV_Control = TextEditingController();
  
  get key => null;
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
     home : Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 242, 245),
        title: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: const Color.fromARGB(255, 240, 242, 245),
      body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children :[
                if(widget.payment=='MasterCard')
                Transform.scale(scale : 4 ,child: Image.asset('images/mastercard.png'))
                else if(widget.payment=='Stripe')
                Transform.scale(scale : 4,child: Image.asset('images/stripe.png'))
                else if(widget.payment=='PayPal')
                Transform.scale(scale : 4,child: Image.asset('images/paypal.png')),
                Text("Payment with ${widget.payment}",style: const TextStyle(fontSize: 30),),
                 Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12)
                      ),
                  width: 360,
                   child: TextField(
                     decoration: const InputDecoration(
                      hintText: ' Enter your card details',
                          border: InputBorder.none
                         ),
                        controller: CardDetailsControl,
                      ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12)
                      ),
                      width: 150,
                     child: TextField(
                         decoration: const InputDecoration(
                          hintText: ' DD/MM',
                          border: InputBorder.none
                         ),
                         controller: DateControl,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12)
                      ),
                      width: 150,
                     child: TextField(
                         decoration: const InputDecoration(
                          hintText: ' Enter CVV',
                          border: InputBorder.none
                         ),
                         controller: CVV_Control,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 400,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffF9881F)
                    ),
                    onPressed: (){
                      if(CardDetailsControl.text==''||DateControl.text==''||CVV_Control.text==''){
                      showModalBottomSheet(context: context,
                       builder: (context){
                           return const SizedBox(
                            height: 60,
                             width :double.infinity, 
                             child: Center(child: Text("Please enter your card details"))
                           );
                         }
                       );
                      }
                      else{
                        Navigator.push(context, 
                        MaterialPageRoute(
                        builder:(context)=>const CompletedOrder() 
                          )
                        );
                      }
                    },
                     child: const Text("Pay now",style: TextStyle(color: Colors.white),)),
                )
            ] 
          ),
        )
      )       
    ); 
  }
}