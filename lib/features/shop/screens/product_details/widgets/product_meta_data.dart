import 'package:ecommerce_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_store/common/widgets/images/circular_image.dart';
import 'package:ecommerce_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_store/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_store/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/enums.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: Sizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: Sizes.sm, vertical: Sizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: Sizes.spaceBtwItems),
            const ProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),
        const ProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text('In-Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 1.5),
        Row(
          children: [
            CircularImage(
              image: ImageStrings.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? AppColors.white : AppColors.black,
            ),
            const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
