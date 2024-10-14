import 'package:flutter/material.dart';

class OnBoardingWidget extends StatefulWidget{
  final double? height;
  final double? width;
  const OnBoardingWidget({super.key,this.height,this.width,});
  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget>{
  int currentIndex = 0;
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: PageView.builder(
                itemCount: 3,
                onPageChanged: (value){
                  setState((){
                    currentIndex = value;
                  });
                },
                itemBuilder:(context, index){
                  return Image(
                    image: AssetImage('lib/image/get-started-$index.png')
                  );
                },
              ),
            ),
          ),

          // space between
          const SizedBox(height: 5,),

          // indicator slidar
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0,1,2].map(
                (index) => Container(
                  width: (index == currentIndex ? 10 : 8),
                  height: (index == currentIndex ? 10 : 8),
                  margin: EdgeInsets.only(right: (index != 2 ? 15 : 0)),
                  decoration: BoxDecoration(
                    color: currentIndex == index ? const Color(0xff0b735f) : const Color(0xffc4c4c4),
                    borderRadius: BorderRadius.circular(150),
                  ),
                )
              ).toList(),
            )
          ),
        ],
      ),
    );
  }
}