
import 'package:carousel_slider/carousel_slider.dart' as c;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../common/widgets/container/circular_container.dart';
import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/controller/home_container.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(children: [
      c.CarouselSlider(
        items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
        options: c.CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)),
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < banners.length; i++)
               CircularContainer(
                width: 20,
                height: 4,
                backgroundColor: controller.carouselCurrentIndex.value == i ?TColors.primary : TColors.grey,
                margin: const EdgeInsets.only(right: 10),
              ),
          ],
        ),
      )
    ]);
  }
}
