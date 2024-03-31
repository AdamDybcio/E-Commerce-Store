import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: Sizes.spaceBtwSections),
                  SearchContainer(text: 'Search In Store'),
                  SizedBox(height: Sizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: Sizes.spaceBtwItems),
                        HomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(banners: [ImageStrings.promoBanner1, ImageStrings.promoBanner2, ImageStrings.promoBanner3]),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  SectionHeading(title: 'Popular Products', onPressed: () {}),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  GridLayout(itemCount: 2, itemBuilder: (_, index) => const ProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
