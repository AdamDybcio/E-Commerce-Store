import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_store/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_store/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce_store/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [CartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: HelperFunctions.isDarkMode(context) ? AppColors.black : AppColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(Sizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: Sizes.spaceBtwItems),
                      const SearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: Sizes.spaceBtwSections),
                      SectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: Sizes.spaceBtwItems / 1.5),
                      Obx(
                        () {
                          if (brandController.isLoading.value) return const CustomBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                          }

                          return GridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];

                              return BrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => CategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
