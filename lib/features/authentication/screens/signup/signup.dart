import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_store/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_store/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerce_store/utils/constants/text_strings.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextStrings.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Sizes.spaceBtwSections),
              const SignupForm(),
              const SizedBox(height: Sizes.spaceBtwSections),
              FormDivider(dividerText: TextStrings.orSignUpWith.capitalize!),
              const SizedBox(height: Sizes.spaceBtwSections),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
