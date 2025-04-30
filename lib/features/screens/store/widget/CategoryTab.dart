import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_cart_vertical.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/features/shop/controller/ProductController.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              //// brands
              const BrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ],
              ),
              const BrandShowcase(
                images: [
                  TImages.productImage5,
                  TImages.productImage6,
                  TImages.productImage7
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //// products
              SectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                  itemCount: controller.featuredProducts.length,
                  itemBuilder: (_, index) => ProductCardVertical(product: controller.featuredProducts[index],)),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ]),
          ),
        ]);
  }
}
