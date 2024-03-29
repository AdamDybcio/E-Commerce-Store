import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TextStrings.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.grey)),
          Text(
            TextStrings.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {},
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
