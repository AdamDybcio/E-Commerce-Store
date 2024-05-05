import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmerEffect(width: 180, height: 180),
            SizedBox(height: Sizes.spaceBtwItems),
            CustomShimmerEffect(width: 160, height: 15),
            SizedBox(height: Sizes.spaceBtwItems / 2),
            CustomShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
