import 'package:flutter/cupertino.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';

import '../../../features/screens/home/widgets/HomeCategores.dart';
import '../../../utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (_, __) =>
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// image
              ShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems/2,),

              /// text
              ShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}