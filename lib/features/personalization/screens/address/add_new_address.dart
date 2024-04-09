import 'package:ecommerce_store/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street')),
                    ),
                    const SizedBox(width: Sizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code')),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City')),
                    ),
                    const SizedBox(width: Sizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State')),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                const SizedBox(height: Sizes.defaultSpace),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
