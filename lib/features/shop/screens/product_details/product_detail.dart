import 'package:ecommerce_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_store/utils/constants/sizes.dart';

import 'widgets/product_image_slider.dart';
import 'widgets/rating_share.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(right: Sizes.defaultSpace, left: Sizes.defaultSpace, bottom: Sizes.defaultSpace),
              child: Column(
                children: [
                  RatingAndShare(),
                  ProductMetaData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
