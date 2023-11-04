

import 'package:e_comerce_app/models/cart_model.dart';
import 'package:e_comerce_app/models/product_model.dart';
import 'package:e_comerce_app/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier{
  Map<String,CartModel> _cartItem = {};
  Map<String,CartModel> get getCartItem{
    return _cartItem;
  }
  void addProductToCart({required String productId}){
    _cartItem.putIfAbsent(productId, () => CartModel(cartId: const Uuid().v4(),
        productId: productId, quantity: 1));
    notifyListeners();
  }

  bool isProductInCart({required String productId}){
    return _cartItem.containsKey(productId);
  }

  void updateCart({required String productId,required int quantity}){
    _cartItem.update(productId,
            (item) =>
                CartModel(cartId: item.productId,
        productId: productId, quantity: quantity));
    notifyListeners();
  }



  double getTotalPrice({
    required ProductProvider productProvider
}){
    double total= 0.0;
    _cartItem.forEach((key, value) {
      final ProductModel? getCurrentProduct = productProvider.findByProdId(value.productId);
      if(getCurrentProduct == null){
        total +=0.0;
      }
      else{
        total +=double.parse(getCurrentProduct.productPrice)*value.quantity;
      }
    });
    return total;
  }

  int getQty(){
    int total = 0;
    _cartItem.forEach((key, value) {
      total +=value.quantity;
    });
    return total;
  }

  void removeOneItem({required productId}){
    _cartItem.remove(productId);
    notifyListeners();
  }

  void clearLocalCart(){
    _cartItem.clear();
    notifyListeners();
  }

}