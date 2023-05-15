import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture customSvg({String? name, Color? color}) {
  return SvgPicture.asset(
    'assets/images/$name.svg',
  );
}
