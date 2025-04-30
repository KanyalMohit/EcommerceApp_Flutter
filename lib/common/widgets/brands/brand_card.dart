import 'package:flutter/material.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../container/rounded_container.dart';
import '../images/circular_image.dart';
import '../text/brand_title_text_verified_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.showBorder, this.onTap, required this.category,
  });

  final bool showBorder;
  final CategoryModel category;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          //// Icon
            children: [
              Flexible(
                child: CircularImage(
                  isNetworkImage: true,
                  image: category.image,
                  backgroundColor: Colors.transparent,
                  overlayColor:
                  THelperFunctions.isDarkMode(
                      context)
                      ? TColors.white
                      : TColors.black,
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),

              //// text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                     BrandTitleTextVerifiedIcon(
                      title: category.name,
                      brandTextSizes: TextSizes.large,
                    ),
                    Text(
                      '256 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}