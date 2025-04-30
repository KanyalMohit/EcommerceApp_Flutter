import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/SAppBar.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_cart_vertical.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../shop/controller/ProductController.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: const SAppBar(
        title: Text("Popular Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //// dropdown
              DropdownButtonFormField(
                items: [
                    "Name",
                    "Higher Price",
                    "Lower Price",
                    "Sale",
                    "Newest",
                    "popularity"
                  ].map((option) => DropdownMenuItem(value: option ,child: Text(option)))
                      .toList(),
                onChanged: (value) {},
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                //// Products
              ),
              GridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_,index) =>  ProductCardVertical(product:controller.featuredProducts[index],))
            ],
          ),
        ),
      ),
    );
  }
}
