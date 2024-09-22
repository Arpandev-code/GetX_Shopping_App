import 'package:get/get.dart';
import 'package:getx_shopping_cart/models/product.dart';

class CartController extends GetxController {
  var cartedItems = [].obs;
  double get total => cartedItems.fold(0, (sum, item) => sum + item.price);
  void addToCart(Product product) {
    cartedItems.add(product);
  }

  void removeFromCart(Product product) {
    cartedItems.remove(product);
  }
}
