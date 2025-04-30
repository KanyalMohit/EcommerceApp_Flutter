import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/screens/cart/cart.dart';

import '../../../../common/widgets/appbar/SAppBar.dart';
import '../../../../common/widgets/product/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: TColors.white),
          )
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.to( () =>const CartScreen()),
          iconColor: TColors.white,
        )
      ],
    );
  }
}