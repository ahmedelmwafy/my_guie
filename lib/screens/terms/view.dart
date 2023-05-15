import 'package:flutter/material.dart';
import 'package:my_guie/core/color.dart';
import 'package:my_guie/core/size.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/use_location/view.dart';

import '../../widgets/btn.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please follow our terms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'This app should never be considered as a safety solution, the responsibility for the use of this application is solely on the user and the person.'),
            heght20,
            const Text(
              'Terms Of Use',
              style: TextStyle(color: kMainColor, fontWeight: FontWeight.bold),
            ),
            heght10,
            const Text(
              'Respect for your privacy with a strong set of privacy principles in mind, see our full privacy policy in link below.',
            ),
            heght20,
            const Text(
              'Privacy Policy',
              style: TextStyle(color: kMainColor, fontWeight: FontWeight.bold),
            ),
            heght10,
            const Text(
              'By clicking “I Agree”, I accept the binding terms of use and privacy policy.',
            ),
            const Spacer(),
            customButton(
                context: context,
                title: 'I Agree',
                onTap: () {
                  RouteManager.navigateTo(const UseLocation());
                }),
            heght20,
            customBorderButton(
                context: context, title: 'Disagree', onTap: () {})
          ],
        ),
      ),
    );
  }
}
