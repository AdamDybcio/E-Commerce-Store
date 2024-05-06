import 'package:ecommerce_store/utils/constants/image_strings.dart';

import '../features/shop/models/banner_model.dart';
import '../routes/routes.dart';

class DummyData {
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: ImageStrings.banner1, targetScreen: Routes.order, active: false),
    BannerModel(imageUrl: ImageStrings.banner2, targetScreen: Routes.cart, active: true),
    BannerModel(imageUrl: ImageStrings.banner3, targetScreen: Routes.favourites, active: true),
    BannerModel(imageUrl: ImageStrings.banner4, targetScreen: Routes.search, active: true),
    BannerModel(imageUrl: ImageStrings.banner5, targetScreen: Routes.settings, active: true),
    BannerModel(imageUrl: ImageStrings.banner6, targetScreen: Routes.userAddress, active: true),
    BannerModel(imageUrl: ImageStrings.banner8, targetScreen: Routes.checkout, active: false),
  ];
}
