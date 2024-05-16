import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: HelperFunctions.isDarkMode(context) ? AppColors.white : AppColors.black,
          backgroundColor: HelperFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: Sizes.spaceBtwItems),
        CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: Sizes.md,
          color: AppColors.white,
          backgroundColor: AppColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
