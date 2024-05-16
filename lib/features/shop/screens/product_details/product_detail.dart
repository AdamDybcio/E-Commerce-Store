import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/rating_share.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(right: Sizes.defaultSpace, left: Sizes.defaultSpace, bottom: Sizes.defaultSpace),
              child: Column(
                children: [
                  const RatingAndShare(),
                  ProductMetaData(product: product),
                  if (product.productType == ProductType.variable.toString()) ProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString()) const SizedBox(height: Sizes.spaceBtwSections),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  const SectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                        onPressed: () => Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(product: product),
    );
  }
}
