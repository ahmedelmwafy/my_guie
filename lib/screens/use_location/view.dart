import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/who/view.dart';
import 'package:my_guie/widgets/btn.dart';
import 'package:my_guie/widgets/svg.dart';

class UseLocation extends StatelessWidget {
  const UseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Use your location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
                'Allow location permission in order to notify you about your location in outdoor environments and in supported indoor locations.'),
            customSvg(name: 'location'),
            customButton(
                context: context,
                title: 'Next',
                onTap: () {
                  RouteManager.navigateTo(const WhoAreYou());
                }),
          ],
        ),
      ),
    );
  }
}
