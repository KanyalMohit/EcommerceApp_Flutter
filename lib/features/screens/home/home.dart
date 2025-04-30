import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_cart_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmers.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/features/screens/all_products/all_products.dart';
import 'package:t_store/features/screens/home/widgets/HomeCategores.dart';

import 'package:t_store/features/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../common/widgets/container/primary_header_container.dart';
import '../../../common/widgets/container/search_container.dart';

import '../../../utils/constants/sizes.dart';
import '../../shop/controller/ProductController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
                child: Column(
                  children: [
                    ////appbar
                    HomeAppBar(),

                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    ////search bar
                    SearchContainer(
                      text: "Search in store",
                      icon: Iconsax.search_normal,
                    ),

                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    ///categories
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          SectionHeading(
                            title: "Popular Categories",
                            showActionButton: false,
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          ////categories
                          HomeCategories(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  ////heading
                  SectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => const AllProduct()),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///popular products
                  Obx(
                          () {
                        if (controller.isLoading.value) {
                          return const VerticalProductShimmer();
                        }
                        /*if (controller.featuredProducts.isEmpty) {
                          return Center(
                            child: Text("No Data Found", style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,),);
                        }*/
                        return GridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (_,
                                index) =>
                                ProductCardVertical(product: controller
                                    .featuredProducts[index],));
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
