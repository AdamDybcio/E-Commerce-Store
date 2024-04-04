import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: Sizes.spaceBtwItems / 2),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                const TextSpan(text: '(199)'),
              ],
            )),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: Sizes.iconMd)),
      ],
    );
  }
}
