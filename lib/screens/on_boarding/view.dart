import 'package:flutter/material.dart';
import 'package:my_guie/core/color.dart';
import 'package:my_guie/core/imgs.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/home/view.dart';
import 'package:my_guie/widgets/svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> onboardingPages = [
    const OnboardingContent(
      title: 'Welcome',
      description: 'Let’s help each other\nand get the best solution.',
      imgName: '1',
    ),
    const OnboardingContent(
      title: 'Gps',
      description: 'Specifying the place of the blind\nwill be easy',
      imgName: '2',
    ),
    const OnboardingContent(
      title: 'Audio Book',
      description:
          'These books to entertain blind\npeople in their spare time ',
      imgName: '3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return onboardingPages[index];
              },
            ),
          ),
          buildIndicators(),
          const SizedBox(height: 16),
          buildContinueButton(),
        ],
      ),
    );
  }

  Row buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: onboardingPages.map((page) {
        int index = onboardingPages.indexOf(page);
        return Container(
          width:currentPage == index ? 24 : 10,
          height:  10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentPage == index ? kMainColor : Colors.grey,
          ),
        );
      }).toList(),
    );
  }

  GestureDetector buildContinueButton() {
    return GestureDetector(
      onTap: () {
        if (currentPage < onboardingPages.length - 1) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          // Perform any actions after onboarding is completed
          // For example, navigate to the home screen
          RouteManager.navigateTo(const HomeScreen());
        }
      },
      child: Text(
        currentPage < onboardingPages.length - 1 ? 'Next' : 'Get Started',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String imgName;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.imgName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(pngName(imgName)),
        const SizedBox(height: 40),
        Text(title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
