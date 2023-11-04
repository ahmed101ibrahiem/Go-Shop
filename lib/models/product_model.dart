import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductModel with ChangeNotifier{
  final String productId;
  final String productImage;
  final String productTitle;
  final String productPrice;
  final String productCategory;
  final String productQuantity;
  final String productDescription;

  ProductModel(
      {required this.productId,
      required this.productImage,
      required this.productTitle,
      required this.productPrice,
      required this.productCategory,
      required this.productQuantity,
      required this.productDescription,
      });
}


