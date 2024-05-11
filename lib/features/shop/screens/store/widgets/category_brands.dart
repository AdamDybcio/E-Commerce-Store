import 'package:ecommerce_store/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_store/features/shop/models/category_model.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ListTileShimmer(),
              SizedBox(height: Sizes.spaceBtwItems),
              BoxesShimmer(),
              SizedBox(height: Sizes.spaceBtwItems),
            ],
          );

          final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (_, snapshot) {
                  final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return BrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
                },
              );
            },
          );
        });
  }
}
