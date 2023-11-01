import 'package:flutter/material.dart';
import '../core/services/assets_manager.dart';
import '../core/widget/app_name_text.dart';
import '../widgets/bag_empty_widget.dart';
import '../widgets/cart_body.dart';
import '../widgets/cart_bottom_checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty? Scaffold(
        body: BagEmptyWidget(
      title: 'Whoops!',
      mediumTitle: 'Your cart is empty',
      subTitle:
          'Looks like you have not added any thing to your cart.\nGo ahead and explore top categories',
      buttonText: 'Shop now',
      imgPath: AssetsManager.shoppingCart,
    )):Scaffold(
      appBar: AppBar(
        title:const AppNameTextWidget(fontSize: 22.0),
          leading: Padding(
        padding: const EdgeInsets.all(8.0),
    child: Image.asset(AssetsManager.shoppingCart,
    ),
    )),
      bottomSheet: CartBottomCheckout(),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
        return const CartBody();
      },),
    );
  }
}
