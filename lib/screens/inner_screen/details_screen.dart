import 'package:e_comerce_app/core/consts/app_colors.dart';
import 'package:e_comerce_app/core/consts/app_constants.dart';
import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../core/services/assets_manager.dart';
import '../../core/widget/app_name_text.dart';
import '../../core/widget/custom_fav_widget.dart';
import '../../providers/product_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routName = '/ProductDetails';
  const ProductDetailsScreen({
    super.key,
  });

  // final String img;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider =
    Provider.of<ProductProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProdId(productId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameTextWidget(fontSize: 22.0),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              backgroundColor: AppColors.lightGreen,
              alignment: Alignment.topLeft,
              offset: const Offset(-4,-4),
              label:  Text('${cartProvider.getCartItem.length}'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:  const Icon(IconlyLight.bag2,color: Colors.black,size: 18.0,),
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context)?Navigator.of(context).pop():null;
          },
          icon: const Icon(IconlyLight.arrowLeft2,size: 24.0,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(imageUrl: getCurrProduct!.productImage,
              boxFit: BoxFit.contain,
              height: size.height*0.38,
              width: double.infinity,
            ),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(child: Text(
                         getCurrProduct.productTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 20.0),
                      ),),
                      const SizedBox(width: 16.0,),
                       SubtitleTextWidget(label: "${getCurrProduct.productPrice}\$",
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,),
                    ],
                  ),
                  const SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      const CustomFavoriteWidget(size: 28,),
                        const SizedBox(width: 10.0,),
                        Expanded(child: SizedBox(
                          height: kBottomNavigationBarHeight -16.0,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )
                            ),
                              onPressed: (){
                              cartProvider.addProductToCart(productId: productId);
                              },
                              icon:  Icon(cartProvider.isProductInCart(productId: productId)?
                              Icons.done_all:Icons.add_shopping_cart),
                              label:  Text(cartProvider.isProductInCart(productId: productId)?'In Cart':'Add to cart'),),

                        ))
                    ],),
                  ),
                  SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitlesTextWidget(label: 'About this item'),
                        const SubtitleTextWidget(label: 'In Phones')
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SubtitleTextWidget(label: getCurrProduct.productDescription))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
