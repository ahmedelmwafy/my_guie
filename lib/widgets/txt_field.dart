import 'package:flutter/material.dart';

customTextField(
    {controller, hint, icon, validator, keyboardType, obscureText = false}) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey, // Specify the color of the border
          width: 1.0, // Specify the width of the border
        ),
      ),
    ),
    child: TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: hint, prefixIcon: Icon(icon)),
    ),
  );
}
