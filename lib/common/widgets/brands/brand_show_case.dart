import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_store/features/shop/models/brand_model.dart';
import 'package:ecommerce_store/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: RoundedContainer(
        padding: const EdgeInsets.all(Sizes.md),
        showBorder: true,
        borderColor: AppColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
        child: Column(
          children: [
            BrandCard(showBorder: false, brand: brand),
            const SizedBox(height: Sizes.spaceBtwItems),
            Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
            ),
          ],
        ),
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const CustomShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
