import 'package:ecommerce_store/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(Sizes.md),
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      child: Column(
        children: [
          BrandCard(showBorder: false, brand: BrandModel.empty()),
          const SizedBox(height: Sizes.spaceBtwItems),
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: HelperFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
        margin: const EdgeInsets.only(right: Sizes.sm),
        padding: const EdgeInsets.all(Sizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}
