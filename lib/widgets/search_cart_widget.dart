import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../core/widget/custom_fav_widget.dart';
import '../core/widget/subtitle_text.dart';
import '../providers/product_provider.dart';
import '../screens/inner_screen/details_screen.dart';

class SearchCartWidget extends StatefulWidget {
   SearchCartWidget({super.key,required this.productId});

  final String productId;

  @override
  State<SearchCartWidget> createState() => _SearchCartWidgetState();
}

class _SearchCartWidgetState extends State<SearchCartWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findByProdId(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: (){
          /// navigate to product scree
          Navigator.pushNamed(context, ProductDetailsScreen.routName,arguments: getCurrProduct.productId);
        },
        child: Column(
          children: [
            const SizedBox(height: 8.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FancyShimmerImage(
                imageUrl: getCurrProduct!.productImage??
                'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                width: double.infinity,
                height: size.height * 0.22,
              ),
            ),
            const SizedBox(height: 8.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Flexible(
                        child: TitlesTextWidget(
                          label:getCurrProduct!.productTitle?? 'Nike Air Force'*5,
                          maxLines: 2,
                          fontSize: 17.0,
                        ),),
                      const CustomFavoriteWidget(size: 24.0,),
                  ],),
                  const SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(
                        flex: 6,
                        child: SubtitleTextWidget(label: getCurrProduct.productPrice??"166.5\$"),
                      ),
                      Flexible(
                        flex: 2,
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.lightGreen,
                          child: InkWell(
                            splashColor: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              cartProvider.addProductToCart(productId: getCurrProduct.productId);
                            },
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Icon(cartProvider.isProductInCart(
                                  productId:  getCurrProduct.productId)?Icons.check:
                                Icons.add_shopping_cart_rounded,color: Colors.white,
                                size: 18,)),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
