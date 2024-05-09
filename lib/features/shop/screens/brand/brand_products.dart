import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_store/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_store/features/shop/models/brand_model.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true, brand: brand),
              const SizedBox(height: Sizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    const loader = VerticalProductShimmer();

                    final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    final brandProducts = snapshot.data!;
                    return SortableProducts(products: brandProducts);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
