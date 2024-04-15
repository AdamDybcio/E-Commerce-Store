import 'package:ecommerce_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_store/data/repositories/user/user_repository.dart';
import 'package:ecommerce_store/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';
import '../../../../data/services/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      FullScreenLoader.openLoadingDialog('We are processing your information...', ImageStrings.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      FullScreenLoader.stopLoading();
      Loaders.succcessSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
