import 'package:get/get.dart';
import 'package:getx_shopping_cart/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchtheproducts();
  }

  void fetchtheproducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var shoppingItems = [
      Product(name: "Apple iphone 16", price: 1000, description: ''),
      Product(name: "Sumsung s23", price: 500, description: ''),
      Product(name: "Jio Book pro", price: 100, description: ''),
    ];
    products.value = shoppingItems;
  }
}
