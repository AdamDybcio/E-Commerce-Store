import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tiles/payment_tile.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: ImageStrings.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Select Payment Method', showActionButton: false),
            const SizedBox(height: Sizes.spaceBtwSections),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: ImageStrings.paypal)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: ImageStrings.googlePay)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: ImageStrings.applePay)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: ImageStrings.visa)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: ImageStrings.masterCard)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: ImageStrings.paytm)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: ImageStrings.paystack)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            PaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: ImageStrings.creditCard)),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            const SizedBox(height: Sizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
