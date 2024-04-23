import 'package:ecommerce_store/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_store/utils/constants/sizes.dart';
import 'package:ecommerce_store/utils/constants/text_strings.dart';
import 'package:ecommerce_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Re-Authenticate User'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TextStrings.email),
                ),
                const SizedBox(height: Sizes.spaceBtwInputFields),
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => Validator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: TextStrings.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: const Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
