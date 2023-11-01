import 'package:e_comerce_app/core/consts/app_constants.dart';
import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../core/services/assets_manager.dart';
import '../core/widget/app_name_text.dart';
import '../core/widget/custom_fav_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routName = '/ProductDetails';
  const ProductDetailsScreen({
    super.key,
  });

  // final String img;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameTextWidget(fontSize: 22.0),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              backgroundColor: Colors.red[800],
              alignment: Alignment.topLeft,
              offset: const Offset(-4,-4),
              label: const Text('5'),
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
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
          icon: const Icon(IconlyLight.arrowLeft2, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(imageUrl: AppConstants.productImageUrl,
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
                         'Title '*16,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 20.0),
                      ),),
                      const SizedBox(width: 16.0,),
                      const SubtitleTextWidget(label: "166.5\$",
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
                      CustomFavoriteWidget(),
                        const SizedBox(width: 10.0,),
                        Expanded(child: SizedBox(
                          height: kBottomNavigationBarHeight -10,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )
                            ),
                              onPressed: (){},
                              icon: const Icon(Icons.add_shopping_cart),
                              label: const Text('Add to cart'),),

                        ))
                    ],),
                  ),
                  SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitlesTextWidget(label: 'About this item'),
                      SubtitleTextWidget(label: 'In Phones')
                    ],
                  ),
                  SizedBox(height: 24.0,),
                  SubtitleTextWidget(label: 'describtion'*15)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
