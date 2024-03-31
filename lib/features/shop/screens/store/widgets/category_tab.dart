import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const BrandShowcase(images: [ImageStrings.productImage3, ImageStrings.productImage2, ImageStrings.productImage1]),
              const SizedBox(height: Sizes.spaceBtwItems),
              SectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
              const SizedBox(height: Sizes.spaceBtwItems),
              GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
              const SizedBox(height: Sizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
