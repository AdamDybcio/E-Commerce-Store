import 'package:ecommerce_store/common/styles/shadows.dart';
import 'package:ecommerce_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_store/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_store/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_store/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_store/features/shop/models/product_model.dart';
import 'package:ecommerce_store/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/enums.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../texts/product_price_text.dart';
import '../favourite_icon/favourite_icon.dart';
import 'product_card_add_to_cart_button.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(Sizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  Center(child: RoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true)),
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: Sizes.sm,
                        backgroundColor: AppColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.sm, vertical: Sizes.xs),
                        child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
                      ),
                    ),
                  Positioned(top: 0, right: 0, child: FavouriteIcon(productId: product.id)),
                ],
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  BrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: Sizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: Sizes.sm),
                        child: ProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
