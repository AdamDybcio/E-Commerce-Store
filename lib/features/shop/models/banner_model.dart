import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String id;
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      id: data['Id'] ?? '',
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
