import 'package:flutter_svg/flutter_svg.dart';

SvgPicture customSvg({
  String? name,
}) {
  return SvgPicture.asset(
    'assets/images/$name.svg',
  );
}
