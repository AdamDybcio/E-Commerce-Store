import 'package:ecommerce_store/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_store/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce_store/features/shop/models/product_model.dart';
import 'package:ecommerce_store/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    this.selectedVariation.value = selectedVariation;

    getProductVariationStockStatus();
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where(
          (variation) => variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }
}
