import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/SAppBar.dart';
import 'package:t_store/features/screens/order/widget/order_list_item.dart';
import 'package:t_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        //// orders
        child: OrderListItems(),
      ),
    );
  }
}
