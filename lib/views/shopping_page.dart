import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controllers/cart_controller.dart';
import 'package:getx_shopping_cart/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});
  final shoppinController = Get.put(ShoppingController());
  final cartCoontroller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            controller.products[index].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Text(
                            'Price: \$ ${controller.products[index].price.toString()}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          trailing: OutlinedButton(
                              onPressed: () {
                                cartCoontroller
                                    .addToCart(controller.products[index]);
                              },
                              child: Text(
                                "Add",
                                style: Theme.of(context).textTheme.labelMedium,
                              )),
                        );
                      });
                }),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  "Total Price: \$ ${controller.total.toString()}",
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                );
              }),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(controller.cartedItems.length.toString());
        }),
        icon: const Icon(Icons.shopping_bag),
      ),
    );
  }
}
