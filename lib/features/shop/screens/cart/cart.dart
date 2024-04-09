import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: Sizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (_, index) => const Column(
            children: [
              CartItem(),
              SizedBox(height: Sizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      ProductQuantityWithAddRemoveButton(),
                    ],
                  ),
                  ProductPriceText(price: '256'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text('Checkout \$256')),
      ),
    );
  }
}
