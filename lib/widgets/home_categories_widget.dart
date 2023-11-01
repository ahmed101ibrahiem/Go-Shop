import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../core/widget/custom_fav_widget.dart';
import '../core/widget/subtitle_text.dart';
import '../core/widget/title_text.dart';


class LatestArrivalCardWidget extends StatelessWidget {
  const LatestArrivalCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width*0.45,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FancyShimmerImage(
                  imageUrl: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlesTextWidget(
                    label: "Title" * 10,
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

                        ),
                        CustomFavoriteWidget(),
                      ],
                    ),
                  )
                  ,
                  FittedBox(child: SubtitleTextWidget(label: '\$1399')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}