import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/widgets/appbar/SAppBar.dart';
import 'package:t_store/common/widgets/text/product_price_text.dart';
import 'package:t_store/features/screens/cart/widget/cart_items.dart';
import 'package:t_store/features/screens/checkout/checkout.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../common/widgets/product/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text("Checkout \$729.0"),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: CartItems(),
      ),
    );
  }
}
