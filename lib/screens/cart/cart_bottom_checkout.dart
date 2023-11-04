import 'package:e_comerce_app/core/consts/app_colors.dart';
import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:e_comerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      height: kBottomNavigationBarHeight + 10,
      padding:  const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
      decoration:BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,
      border: const Border(top: BorderSide(width: 1,color: Colors.grey))
      ),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(child: TitlesTextWidget(
                  fontSize: 18.0,
                    label: 'Total (${cartProvider.getCartItem.length} products/${cartProvider.getQty()} Items)')),
              const  Spacer(),
                 SubtitleTextWidget(
                   fontSize: 17,
                   fontWeight: FontWeight.w500,
                   label: '${
                       cartProvider.getTotalPrice(
                           productProvider: productProvider).toStringAsFixed(2)}\$',
                   color: Colors.lightGreen[700],)
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
            ),
              onPressed: (){}, child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text('Checkout')))
        ],
      ),
    );
  }
}
