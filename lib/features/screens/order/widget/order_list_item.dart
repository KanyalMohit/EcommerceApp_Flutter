import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/container/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //// row 1
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),

                //// status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        "07 Nov 2024",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),

                //// Icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_14,
                      size: TSizes.iconSm,
                    ))
              ],
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            Row(
              children: [
                ///// row 2
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      //// status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              "[#2131]",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),

                      //// status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              "03 Feb 2025",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
