import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

class CustomBrandsShimmer extends StatelessWidget {
  const CustomBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const CustomShimmerEffect(width: 300, height: 80),
    );
  }
}
