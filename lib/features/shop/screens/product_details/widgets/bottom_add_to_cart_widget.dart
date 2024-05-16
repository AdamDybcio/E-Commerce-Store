import 'package:ecommerce_store/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_store/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_store/features/shop/models/product_model.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace, vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(Sizes.cardRadiusLg),
          topLeft: Radius.circular(Sizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: AppColors.darkGrey,
                  width: 40,
                  height: 40,
                  onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
                  color: AppColors.white,
                ),
                const SizedBox(width: Sizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: Sizes.spaceBtwItems),
                CircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: AppColors.black,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(Sizes.md),
                backgroundColor: AppColors.black,
                side: const BorderSide(color: AppColors.black),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
