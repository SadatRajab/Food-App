import 'package:flutter/material.dart';

InputDecoration customInputDecoration({required String hint, IconButton ?suffixIcon, }) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    hintText: hint,
  );
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email'; // رسالة خطأ إذا كان الحقل فارغ
  }
  
  // تحقق من صحة الإيميل باستخدام Regex
  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
    return 'Please enter a valid email'; // رسالة خطأ إذا كان الإيميل غير صحيح
  }
  
  return null; // إذا كان المدخل صحيح
}