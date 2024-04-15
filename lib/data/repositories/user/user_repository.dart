import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_store/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
