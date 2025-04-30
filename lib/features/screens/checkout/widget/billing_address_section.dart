import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/text/sectio_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: "Shipping Address" , buttonTitle: "Change" , onPressed: (){},),
        Text("Mohit Kanyal" , style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone , color: Colors.grey , size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("+91 -3724897323" , style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history , color: Colors.grey , size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("xyz line , abc colony" , style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
      ],
    );
  }
}
