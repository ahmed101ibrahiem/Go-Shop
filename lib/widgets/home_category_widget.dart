import 'package:flutter/material.dart';

import '../core/consts/app_constants.dart';
import '../core/widget/subtitle_text.dart';


class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(

      children: List.generate(AppConstants.homeCategories.length,
              (index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage(AppConstants.homeCategories[index].image)),
                const SizedBox(height: 10.0,),
                SubtitleTextWidget(label: AppConstants.homeCategories[index].name)
              ],
            ),
          )),
    );
  }
}
