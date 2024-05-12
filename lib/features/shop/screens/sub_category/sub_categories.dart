import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_store/features/shop/models/category_model.dart';
import 'package:ecommerce_store/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(imageUrl: ImageStrings.promoBanner1, applyImageRadius: true, width: double.infinity),
              const SizedBox(height: Sizes.spaceBtwSections),
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = HorizontalProductsShimmer();

                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          const loader = HorizontalProductsShimmer();

                          final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                          if (widget != null) return widget;

                          final products = snapshot.data!;

                          return Column(
                            children: [
                              SectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(
                                  AllProducts(
                                    title: subCategory.name,
                                    futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems / 2),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  separatorBuilder: (context, index) => const SizedBox(width: Sizes.spaceBtwItems),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => ProductCardHorizontal(product: products[index]),
                                ),
                              ),
                              const SizedBox(height: Sizes.spaceBtwSections),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
