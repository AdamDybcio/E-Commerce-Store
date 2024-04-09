import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerce_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AppColors.primary,
        child: const Icon(Iconsax.add, color: AppColors.white),
      ),
      appBar: CustomAppBar(showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall)),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          children: [
            SingleAddress(selectedAddress: true),
            SingleAddress(selectedAddress: false),
          ],
        ),
      ),
    );
  }
}
