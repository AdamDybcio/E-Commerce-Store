import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_store/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmers/brands_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              Obx(
                () {
                  if (controller.isLoading.value) return const CustomBrandsShimmer();

                  if (controller.allBrands.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                  }

                  return GridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = controller.allBrands[index];

                      return BrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
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
