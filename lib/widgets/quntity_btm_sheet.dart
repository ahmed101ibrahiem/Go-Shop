
import 'dart:developer';

import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/models/cart_model.dart';
import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key,required this.cartModel});

  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

         const SizedBox(height: 20.0,),
          Container(
            height: 6.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20.0,),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
            return  InkWell(
              onTap: (){
                cartProvider.updateCart(productId: cartModel.productId,
                    quantity: index +1);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(child: SubtitleTextWidget(label:'${index + 1}',)),
              ),
            );
            },),
          ),
        ],
      ),
    );
  }
}
