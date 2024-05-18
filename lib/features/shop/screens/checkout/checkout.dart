import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_store/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/pricing_calculator.dart';
import 'package:ecommerce_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product/order_controller.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    final orderController = Get.put(OrderController());
    final totalAmount = PricingCalculator.calculateTotalPrice(subTotal, 'US');

    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(showAddRemoveButtons: false),
              const SizedBox(height: Sizes.spaceBtwSections),
              const CouponCode(),
              const SizedBox(height: Sizes.spaceBtwSections),
              RoundedContainer(
                padding: const EdgeInsets.all(Sizes.md),
                showBorder: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(height: Sizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: Sizes.spaceBtwItems),
                    BillingPaymentSection(),
                    SizedBox(height: Sizes.spaceBtwItems),
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => Loaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
