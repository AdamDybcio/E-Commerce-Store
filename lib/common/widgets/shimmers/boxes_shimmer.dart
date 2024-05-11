import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(height: Sizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(height: Sizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
