import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../common/widgets/text/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 4,
      itemBuilder: (_, index) =>  Column(
        children: [
          const CartItem(),
         if(showAddRemoveButton) const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          if(showAddRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  //// add remove button
                  ProductQuantityAddRemove(),
                ],
              ),

              /// price
              ProductPriceText(price: "243")
            ],
          )
        ],
      ),
    );
  }
}
