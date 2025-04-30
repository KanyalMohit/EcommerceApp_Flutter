import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/container/rounded_container.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark  = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
          title: "Payment Method",
          buttonTitle: "Change",
          showActionButton: true,
          onPressed: (){},
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.light : TColors.white ,
              child: const Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}

