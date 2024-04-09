import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/features/personalization/screens/address/address.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white)),
                  ),
                  UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const SettingsMenuTile(
                      icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout'),
                  const SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders'),
                  const SettingsMenuTile(
                      icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                  const SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  const SettingsMenuTile(
                      icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  const SettingsMenuTile(
                      icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  const SectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  const SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
