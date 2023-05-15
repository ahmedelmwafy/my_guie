import 'package:flutter/material.dart';
import 'package:my_guie/core/color.dart';
import 'package:my_guie/core/shadow.dart';

customButton({title, context, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: const [customShadow],
          color: kMainColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: kWhiteColor),
        ),
      ),
    ),
  );
}

customBorderButton({context, title, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: const [customShadow],
          border: Border.all(color: kMainColor),
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: kMainColor),
        ),
      ),
    ),
  );
}
