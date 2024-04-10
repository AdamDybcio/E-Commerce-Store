import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Sports shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(imageUrl: ImageStrings.promoBanner1, applyImageRadius: true, width: double.infinity),
              const SizedBox(height: Sizes.spaceBtwSections),
              Column(
                children: [
                  SectionHeading(title: 'Sports shirts', onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      separatorBuilder: (context, index) => const SizedBox(width: Sizes.spaceBtwItems),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
