import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_store/features/shop/models/banner_model.dart';
import 'package:ecommerce_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(CustomFirebaseStorageService());

      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        final url = await storage.uploadImageData('Banners', file, banner.id);

        banner.imageUrl = url;

        await _db.collection('Banners').doc(banner.id).set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
