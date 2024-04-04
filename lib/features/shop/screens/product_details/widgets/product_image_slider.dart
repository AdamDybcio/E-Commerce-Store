import 'package:ecommerce_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(Sizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(ImageStrings.productImage1))),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: Sizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(width: Sizes.spaceBtwItems),
                  itemBuilder: (_, index) => RoundedImage(
                    imageUrl: ImageStrings.productImage3,
                    width: 80,
                    backgroundColor: dark ? AppColors.black : AppColors.white,
                    border: Border.all(color: AppColors.primary),
                    padding: const EdgeInsets.all(Sizes.sm),
                  ),
                ),
              ),
            ),
            const CustomAppBar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
