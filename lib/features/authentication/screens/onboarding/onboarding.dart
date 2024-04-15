import 'package:ecommerce_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: ImageStrings.onBoardingImage1,
                title: TextStrings.onBoardingTitle1,
                subTitle: TextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: ImageStrings.onBoardingImage2,
                title: TextStrings.onBoardingTitle2,
                subTitle: TextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: ImageStrings.onBoardingImage3,
                title: TextStrings.onBoardingTitle3,
                subTitle: TextStrings.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
