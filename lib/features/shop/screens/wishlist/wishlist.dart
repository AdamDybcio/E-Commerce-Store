import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_store/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../navigation_menu.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                const loader = VerticalProductShimmer(itemCount: 6);

                final emptyWidget = AnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: ImageStrings.pencilAnimation,
                  showAction: true,
                  actionText: "Let's add some",
                  onActionPressed: () => Get.offAll(() => const NavigationMenu()),
                );

                final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);

                if (widget != null) return widget;

                final products = snapshot.data!;

                return GridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => ProductCardVertical(product: products[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
