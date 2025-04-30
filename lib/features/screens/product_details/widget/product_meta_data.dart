import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/text/ProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_text_verified_icon.dart';
import 'package:t_store/common/widgets/text/product_price_text.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/container/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/controller/ProductController.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
    controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //// sale tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                "$salePercentage%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(product.price.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
             ProductPriceText(
              price: product.salePrice.toString(),
              lineThrough: false,
              isLarge: true,
            ),
          ],
        ),

        //// title
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

         ProductTitleText(
          title: product.title,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        //// stock status
        Row(children: [
          const ProductTitleText(title: "Status"),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text(
            "In Stock",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ]),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brands
        Row(
          children: [
            CircularImage(
              image: product.brand!.image,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
             BrandTitleTextVerifiedIcon(
              title: product.brand!.name,
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
