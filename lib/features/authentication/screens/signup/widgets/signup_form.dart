import 'package:ecommerce_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_conditions_checkbox.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => Validator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TextStrings.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => Validator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TextStrings.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) => Validator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TextStrings.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TextStrings.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => Validator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TextStrings.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
          const TermsAndConditionsCheckbox(),
          const SizedBox(height: Sizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TextStrings.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
