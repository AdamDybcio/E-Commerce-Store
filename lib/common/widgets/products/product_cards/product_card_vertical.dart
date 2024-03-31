import 'package:ecommerce_store/common/styles/shadows.dart';
import 'package:ecommerce_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_store/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_store/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: dark ? AppColors.darkerGrey : AppColors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  const RoundedImage(imageUrl: ImageStrings.productImage1, applyImageRadius: true),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.sm, vertical: Sizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
                    ),
                  ),
                  const Positioned(top: 0, right: 0, child: CircularIcon(icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            const Padding(
              padding: EdgeInsets.only(left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Green Nike Air Shoes', smallSize: true),
                  SizedBox(height: Sizes.spaceBtwItems / 2),
                  BrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(padding: EdgeInsets.only(left: Sizes.sm), child: ProductPriceText(price: '35.0')),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.cardRadiusMd),
                      bottomRight: Radius.circular(Sizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: Sizes.iconLg * 1.2,
                    height: Sizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: AppColors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
