import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../core/widget/subtitle_text.dart';

class SearchCartWidget extends StatelessWidget {
  const SearchCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: (){
          /// navigate to product screen
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
            Row(
              children: [
              Flexible(
                flex: 5,
                  child: TitlesTextWidget(label: 'Nike Air Force'*5,maxLines: 2,),),
                Flexible(
                child: InkWell(
                  onTap: (){},
                    child: const Icon(IconlyLight.heart)),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
