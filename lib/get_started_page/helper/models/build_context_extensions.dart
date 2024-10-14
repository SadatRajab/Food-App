import 'package:flutter/material.dart';

extension BuildContextHelper on BuildContext{
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get sHW => (MediaQuery.of(this).size.height / MediaQuery.of(this).size.width);
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom == 0;
  bool get is24HoursMode => MediaQuery.of(this).alwaysUse24HourFormat;

  void push(Widget screen){
    Navigator.push(
      this,
      MaterialPageRoute(
        builder:(context){
          return screen;
        },
      )
    );
  }

  void pop(){
    Navigator.pop(this);
  }
}