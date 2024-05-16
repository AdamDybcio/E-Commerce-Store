import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_store/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_store/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_store/navigation_menu.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Obx(
        () {
          final emptyWidget = AnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY.',
            animation: ImageStrings.docerAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Sizes.defaultSpace),
                child: CartItems(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
