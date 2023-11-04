import 'package:e_comerce_app/models/cart_model.dart';
import 'package:e_comerce_app/models/product_model.dart';
import 'package:e_comerce_app/screens/inner_screen/details_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../core/widget/custom_fav_widget.dart';
import '../core/widget/subtitle_text.dart';
import '../core/widget/title_text.dart';


class LatestArrivalCardWidget extends StatelessWidget {
  const LatestArrivalCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productModel = Provider.of<ProductModel>(context);
    return SizedBox(
      width: size.width*0.45,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, ProductDetailsScreen.routName);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FancyShimmerImage(
                    imageUrl: productModel.productImage,
                    height: size.height * 0.2,
                    width: size.width * 0.2,
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlesTextWidget(
                      label: productModel.productTitle,
                      maxLines: 2,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,

                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(IconlyLight.shieldDone,),
                            color: Colors.green,
                            iconSize: 32.0,

                          ),
                          CustomFavoriteWidget(size: 32.0),
                        ],
                      ),
                    )
                    ,
                     FittedBox(child: SubtitleTextWidget(label: '\$${productModel.productPrice}',fontSize: 16.0,)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}