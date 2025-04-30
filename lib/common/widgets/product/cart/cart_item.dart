

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_images.dart';
import '../../text/ProductTitleText.dart';
import '../../text/brand_title_text_verified_icon.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor:
          dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        //// title , price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextVerifiedIcon(title: "Nike"),
              const Flexible(
                child: ProductTitleText(
                  title: "THis is nike shoes",
                  maxLines: 1,
                ),
              ),

              /// attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Color  ",
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: "Green  ",
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: "Size  ",
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: "UK 08  ",
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}