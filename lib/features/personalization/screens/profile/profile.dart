import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/common/widgets/images/circular_image.dart';
import 'package:ecommerce_store/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircularImage(image: ImageStrings.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              const SectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              ProfileMenu(title: 'Name', value: 'Jan Kowalski', onPressed: () {}),
              ProfileMenu(title: 'Username', value: 'jan_kowalski', onPressed: () {}),
              const SizedBox(height: Sizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              const SectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: Sizes.spaceBtwItems),
              ProfileMenu(onPressed: () {}, title: 'User ID', value: '45689', icon: Iconsax.copy),
              ProfileMenu(onPressed: () {}, title: 'E-mail', value: 'jan.kowalski'),
              ProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+48 123 123 123'),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '28 Jan, 2002'),
              const Divider(),
              const SizedBox(height: Sizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
