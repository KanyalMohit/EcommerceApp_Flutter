import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/container/search_container.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/text/brand_title_text_verified_icon.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/features/screens/store/widget/CategoryTab.dart';
import 'package:t_store/features/shop/controller/category_controller.dart';

import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../common/widgets/appbar/SAppBar.dart';
import '../../../common/widgets/appbar/TTabBar.dart';
import '../../../common/widgets/brands/brand_card.dart';
import '../../../utils/constants/colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.allCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: SAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(
              onPressed: () {},
              iconColor: TColors.black,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                automaticallyImplyLeading: false,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///search bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const SearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      //// Feature Brands
                      SectionHeading(
                        title: "Feature Brands",
                        onPressed: () {},
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwSections / 1.5,
                      ),

                      GridLayout(
                          itemCount: categories.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final element = categories[index];
                            return BrandCard(showBorder: false, category: element) ;
                          }),
                    ],
                  ),
                ),
                bottom:  TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name),)).toList()),
              )
            ];
          },
          body: TabBarView(
            children: categories.map((category) => CategoryTab(category: category) ).toList(),
          ),
        ),
      ),
    );
  }
}
