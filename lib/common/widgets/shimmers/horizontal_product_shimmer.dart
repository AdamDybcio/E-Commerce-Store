import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalProductsShimmer extends StatelessWidget {
  const HorizontalProductsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: Sizes.spaceBtwItems),
        itemCount: itemCount,
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomShimmerEffect(width: 120, height: 120),
            SizedBox(width: Sizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Sizes.spaceBtwItems / 2),
                CustomShimmerEffect(width: 160, height: 15),
                SizedBox(height: Sizes.spaceBtwItems / 2),
                CustomShimmerEffect(width: 110, height: 15),
                SizedBox(height: Sizes.spaceBtwItems / 2),
                CustomShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
