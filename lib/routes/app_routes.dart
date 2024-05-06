import 'package:ecommerce_store/features/authentication/screens/login/login.dart';
import 'package:ecommerce_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_store/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_store/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_store/features/personalization/screens/address/address.dart';
import 'package:ecommerce_store/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_store/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce_store/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_store/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_store/features/shop/screens/home/home.dart';
import 'package:ecommerce_store/features/shop/screens/order/order.dart';
import 'package:ecommerce_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_store/features/shop/screens/store/store.dart';
import 'package:ecommerce_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce_store/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
    GetPage(name: Routes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: Routes.signup, page: () => const SignupScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: Routes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
