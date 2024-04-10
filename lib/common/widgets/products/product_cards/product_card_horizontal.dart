import 'package:ecommerce_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_store/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_store/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_store/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: 292,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.softGrey,
      ),
      child: Row(
        children: [
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Sizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.white,
            child: const Stack(
              children: [
                RoundedImage(imageUrl: ImageStrings.productImage1, applyImageRadius: true),
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Sizes.sm, left: Sizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true),
                      SizedBox(height: Sizes.spaceBtwItems / 2),
                      BrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: ProductPriceText(price: '256.0')),
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
          ),
        ],
      ),
    );
  }
}
