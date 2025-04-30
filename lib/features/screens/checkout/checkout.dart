import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/container/rounded_container.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/screens/cart/widget/cart_items.dart';
import 'package:t_store/features/screens/checkout/widget/billing_address_section.dart';
import 'package:t_store/features/screens/checkout/widget/billing_amount_section.dart';
import 'package:t_store/features/screens/checkout/widget/billing_payment_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../common/widgets/appbar/SAppBar.dart';
import '../../../common/widgets/product/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: "Payment Success!",
                subtitle: "Your item will be shipped soon",
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: const Text("Checkout \$729.0"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //// coupon TextFiel
              const CouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //// billing section
              RoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    //// pricing
                    BillingAmountSection(),

                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ////divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ////Payment Methods
                    BillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //// address section
                    BillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
