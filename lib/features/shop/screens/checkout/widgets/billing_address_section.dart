import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(addressController.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      Text(addressController.selectedAddress.value.formattedPhoneNo, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history, color: Colors.grey, size: 16),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      Expanded(child: Text(addressController.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
                    ],
                  ),
                ],
              )
            : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
