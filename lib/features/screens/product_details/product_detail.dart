import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/features/screens/product_details/widget/BottomAddToCart.dart';
import 'package:t_store/features/screens/product_details/widget/Product_attribute.dart';
import 'package:t_store/features/screens/product_details/widget/product_detail_image_slider.dart';
import 'package:t_store/features/screens/product_details/widget/product_meta_data.dart';
import 'package:t_store/features/screens/product_details/widget/rating_share_widget.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //// product slider
             ProductImageSlider(product: product,),

            //// Product details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  //// Rating and share button
                  const RatingAndShare(),

                  //// price title stack and
                   ProductMetaData(product: product,),

                  //// attribute
                   ProductAttributes(product: product),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //// Description
                  const SectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dictum varius duis at consectetur lorem donec massa sapien. Lectus quam id leo in vitae turpis massa sed elementum. Ultrices sagittis orci a scelerisque purus. Quam elementum pulvinar etiam non quam lacus suspendisse. Purus semper eget duis at tellus at. Sit amet porttitor eget dolor. Mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor. Nec feugiat nisl pretium fusce id velit ut tortor. Lectus magna fringilla urna porttitor rhoncus dolor purus. Leo integer malesuada nunc vel risus commodo.",
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: " less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  const Divider(),
                  //// Reviews
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHeading(
                          title: "Reviews(199)",
                          showActionButton: false,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.arrow_right_3,
                              size: 18,
                            ))
                      ]),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
