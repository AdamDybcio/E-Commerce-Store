import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(Sizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? AppColors.darkerGrey
              : AppColors.grey,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? AppColors.light
                      : AppColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.sm / 2),
              const Text('(+123) 456 789 012', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: Sizes.sm / 2),
              const Text('82356 Timmy Coves, South Liana, Maine, 87665, USA', softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}
