
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/SAppBar.dart';
import '../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../shop/models/product_model.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key, required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            //// main large image
             SizedBox(
                height: 400,
                child: Padding(
                    padding:
                    const EdgeInsets.all(TSizes.productImageRadius * 2),
                    child: Center(
                        child: Image(
                            image: NetworkImage(product.thumbnail) )))),
            //// image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: product.images!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    fit: BoxFit.contain,
                    imageUrl: product.images![index],
                    isNetworkImage: true,
                    backgroundColor:
                    dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                  ),
                ),
              ),
            ),

            //// App bar icon
            const SAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}