import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/SAppBar.dart';
import 'package:t_store/common/widgets/images/rounded_images.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text("Sports"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //// Banner
              const RoundedImage(
                imageUrl: TImages.promoBanner3,
                width: double.infinity,
                applyImageRadius: true,
                height: null,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //// sub categories
              Column(
                children: [
                  //// heading
                  SectionHeading(
                    title: "Sports Shirts",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) {
                          return const ProductCardHorizontal();
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
