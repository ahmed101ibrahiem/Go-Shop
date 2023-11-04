import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/assets_manager.dart';
import '../../core/services/my_app_method.dart';
import '../../core/widget/app_name_text.dart';
import '../../core/widget/title_text.dart';
import '../../widgets/bag_empty_widget.dart';
import 'cart_body.dart';
import 'cart_bottom_checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider= Provider.of<CartProvider>(context);
    return cartProvider.getCartItem.isEmpty? Scaffold(
        body: BagEmptyWidget(
      title: 'Whoops!',
      mediumTitle: 'Your cart is empty',
      subTitle:
          'Looks like you have not added any thing to your cart.\nGo ahead and explore top categories',
      buttonText: 'Shop now',
      imgPath: AssetsManager.shoppingCart,
    )):
    Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              MyAppMethods.showErrorORWarningDialog(
                  isError: false,
                  context: context,
                  subtitle: "Remove items",
                  fct: () {
                    cartProvider.clearLocalCart();
                    Navigator.pop(context);
                  });
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          ),
        ],
        title:TitlesTextWidget(
            label: "Cart (${cartProvider.getCartItem.length})"),
          leading: Padding(
        padding: const EdgeInsets.all(8.0),
    child: Image.asset(AssetsManager.shoppingCart,
    ),
    )),
      bottomSheet: const CartBottomCheckout(),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight +8),
        itemCount: cartProvider.getCartItem.length,
        itemBuilder: (context, index) {
        return  ChangeNotifierProvider.value(
          value: cartProvider.getCartItem.values.toList().reversed.toList()[index],
            child: const CartBody());
      },),
    );
  }
}
