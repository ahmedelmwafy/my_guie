import 'package:flutter/material.dart';
import 'package:my_guie/screens/sign_up/view.dart';
import 'package:my_guie/widgets/btn.dart';
import 'package:my_guie/widgets/svg.dart';

import '../../core/size.dart';
import '../../helpers/navigation.dart';
import '../use_location/view.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who are you ?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Spacer(),
            customSvg(name: 'who'),
            const Spacer(
              flex: 2,
            ),
            customButton(
                context: context,
                title: 'Blind',
                onTap: () {
                  RouteManager.navigateTo(const SignUp());
                }),
            heght20,
            customBorderButton(
                context: context, title: 'Relitive', onTap: () {})
          ],
        ),
      ),
    );
  }
}
