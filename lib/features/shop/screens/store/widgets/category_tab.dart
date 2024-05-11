import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_store/features/shop/models/category_model.dart';
import 'package:ecommerce_store/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              const SizedBox(height: Sizes.spaceBtwItems),
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (_, snapshot) {
                  final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const VerticalProductShimmer());

                  if (response != null) return response;

                  final products = snapshot.data!;

                  return Column(
                    children: [
                      SectionHeading(
                        title: 'You might like',
                        showActionButton: true,
                        onPressed: () => Get.to(
                          AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                              categoryId: category.id,
                              limit: -1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Sizes.spaceBtwItems),
                      GridLayout(itemCount: products.length, itemBuilder: (_, index) => ProductCardVertical(product: products[index])),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
