import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../core/widget/custom_fav_widget.dart';
import '../core/widget/subtitle_text.dart';
import '../screens/details_screen.dart';

class SearchCartWidget extends StatelessWidget {
  const SearchCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: (){
          /// navigate to product scree
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(),));
        },
        child: Column(
          children: [
            const SizedBox(height: 8.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FancyShimmerImage(
                imageUrl:
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
                    children: [
                    Flexible(
                      flex: 4,
                        child: TitlesTextWidget(label: 'Nike Air Force'*5,maxLines: 2,),),
                      const Flexible(
                          flex: 2,
                      child: CustomFavoriteWidget(size: 24.0,)
                    ),
                  ],),
                  const SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 3,
                        child: SubtitleTextWidget(label: "166.5\$"),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.lightBlue,
                            child: InkWell(
                              splashColor: Colors.red,
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.add_shopping_cart_rounded,size: 16,),
                              ),
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
