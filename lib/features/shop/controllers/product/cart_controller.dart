import 'package:ecommerce_store/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_store/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_store/features/shop/models/product_model.dart';
import 'package:ecommerce_store/utils/constants/enums.dart';
import 'package:ecommerce_store/utils/local_storage/storage_utility.dart';
import 'package:ecommerce_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      Loaders.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty) {
      Loaders.customToast(message: 'Select Variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        Loaders.warningSnackBar(title: 'Oh Snap!', message: 'Selected variation is out of stock.');
        return;
      }
    } else {
      if (product.stock < 1) {
        Loaders.warningSnackBar(title: 'Oh Snap!', message: 'Selected variation is out of stock.');
        return;
      }
    }

    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    Loaders.customToast(message: 'Your Product has been added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(message: 'Product removed from the Cart.');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      quantity: quantity,
      variationId: variation.id,
      price: price,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = LocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
