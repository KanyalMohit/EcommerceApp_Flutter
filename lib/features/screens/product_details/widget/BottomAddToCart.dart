import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 1.obs;
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               CircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                color: TColors.white,
                backgroundColor: TColors.darkerGrey,
                onPressed: (){
                  if(value<=0){
                    value=0 as RxInt;
                    return;
                  }
                  value-=1;
                },
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Obx(() => Text(
                "${value.value}",
                style: Theme.of(context).textTheme.titleSmall,
              )),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              CircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                color: TColors.white,
                backgroundColor: TColors.black,
                onPressed: () {
                  value += 1;
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
