import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/container/rounded_container.dart';
import 'package:t_store/common/widgets/text/ProductTitleText.dart';
import 'package:t_store/common/widgets/text/product_price_text.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/chips/choice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required, required this.product });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final productAttributes = product.productAttributes;
    final color = productAttributes != null && productAttributes.isNotEmpty
        ? productAttributes.first.values
        : null;
    final sizes = productAttributes != null && productAttributes.length > 1
        ? productAttributes[1].values
        : null;
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),

                  //// actual price
                  if(product.productVariations != null)...[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitleText(
                                title: "Price : ",
                                smallSize: true,
                              ),
                              const SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
                              Text("340",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(
                                    decoration: TextDecoration.lineThrough),
                              ),
                              ////sale price
                              const SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
                              ProductPriceText(price: '120')
                            ],
                          ),
                          Row(
                            children: [
                              const ProductTitleText(
                                title: "Stock : ",
                                smallSize: true,
                              ),
                              Text(
                                "In Stock",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                          //// variation Description
                        ])
                  ]
                ],
              ),
               ProductTitleText(
                title:
                    product.description.toString(),
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        //// attributes
        if (color != null) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: "Colors",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Wrap(
                spacing: 8,
                children: color.map((element) {
                  return element != null
                      ? TChoiceChip(
                    text: element,
                    selected: false,
                    onSelected: (value) {},
                  )
                      : const SizedBox();
                }).toList(),
              )
            ],
          ),
        ],
        if (sizes != null) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: "Size",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Wrap(
                spacing: 8,
                children: sizes.map((element) {
                  return element != null
                      ? TChoiceChip(
                    text: element,
                    selected: false,
                    onSelected: (value) {},
                  )
                      : const SizedBox();
                }).toList(),
              )
            ],
          ),
        ],
      ],
    );
  }
}
