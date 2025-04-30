
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/features/screens/onboarding/widgets/onBoarding_navigation.dart';
import 'package:t_store/features/screens/onboarding/widgets/onBoarding_page.dart';
import 'package:t_store/features/screens/onboarding/widgets/onBoarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(onboardingController());

    return  Scaffold(
      body: Stack(
        children: [
          //horizontal scrollbar
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: TImages.onBoardingImage1,title: TTexts.onBoardingTitle1 , subTitle: TTexts.onBoardingSubTitle1,),

              OnBoardingPage(image: TImages.onBoardingImage2,title: TTexts.onBoardingTitle2 , subTitle: TTexts.onBoardingSubTitle2,),

              OnBoardingPage(image: TImages.onBoardingImage3,title: TTexts.onBoardingTitle3 , subTitle: TTexts.onBoardingSubTitle3,)
            ],
          ),
          const OnBoardingSkip(),

          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () { onboardingController.instance.nextPage(); },
        style: ElevatedButton.styleFrom(shape: const CircleBorder() , backgroundColor: dark ? TColors.primary : Colors.black ,  ) ,
        child: const Icon(Iconsax.arrow_right_3),)
    );
  }
}






