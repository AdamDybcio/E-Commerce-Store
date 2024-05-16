import 'package:ecommerce_store/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_store/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(ProductDetailScreen(product: product));
        }
      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

          return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? AppColors.primary : AppColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Sizes.cardRadiusMd),
                bottomRight: Radius.circular(Sizes.productImageRadius),
              ),
            ),
            child: SizedBox(
              width: Sizes.iconLg * 1.2,
              height: Sizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(
                          productQuantityInCart.toString(),
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.white),
                        )
                      : const Icon(Iconsax.add, color: AppColors.white)),
            ),
          );
        },
      ),
    );
  }
}
