import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(width: Sizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: Sizes.spaceBtwItems / 2),
              CustomShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
