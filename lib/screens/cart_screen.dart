import 'package:flutter/material.dart';
import '../core/services/assets_manager.dart';
import '../widgets/bag_empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: BagEmptyWidget(
      title: 'Whoops!',
      mediumTitle: 'Your cart is empty',
      subTitle:
          'Looks like you have not added any thing to your cart.\nGo ahead and explore top categories',
      buttonText: 'Shop now',
      imgPath: AssetsManager.shoppingCart,
    ));
  }
}
