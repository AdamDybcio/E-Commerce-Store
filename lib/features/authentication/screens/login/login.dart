import 'package:ecommerce_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_store/common/styles/spacing_styles.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
              FormDivider(dividerText: TextStrings.orSignInWith.capitalize!),
              const SizedBox(height: Sizes.spaceBtwSections),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
