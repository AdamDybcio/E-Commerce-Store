import 'package:ecommerce_store/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(Sizes.sm),
          backgroundColor: HelperFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(child: ProductTitleText(title: cartItem.title, maxLines: 1)),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(text: ' ${e.key}', style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: '${e.value}', style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
