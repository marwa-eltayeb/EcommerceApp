import 'package:flutter/material.dart';
import 'package:products_app/core/routing/routes.dart';
import 'package:products_app/features/onBoard/data/local/onboard_data.dart';
import 'package:products_app/features/onboard/presentation/screens/widgets/NextButton.dart';
import 'package:products_app/features/onboard/presentation/screens/widgets/OnboardingPageContent.dart';
import 'package:products_app/features/onboard/presentation/screens/widgets/PageIndicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 110),

                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(() => currentIndex = value);
                      },
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) {
                        final data = onboardingData[index];
                        return OnboardingPageContent(
                          image: data.image,
                          title: data.title,
                          description: data.description,
                        );
                      },
                    ),
                  ),
                ),

                PageIndicator(
                  currentIndex: currentIndex,
                  itemCount: onboardingData.length,
                ),

                const SizedBox(height: 20),

                NextButton(
                  onPressed: nextPage,
                  isLastPage: currentIndex == onboardingData.length - 1,
                ),

                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}