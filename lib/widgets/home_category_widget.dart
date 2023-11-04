import 'package:flutter/material.dart';

import '../core/consts/app_constants.dart';
import '../core/widget/subtitle_text.dart';
import '../screens/search_screen.dart';


class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Wrap(
      children: List.generate(AppConstants.homeCategories.length,
              (index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SearchScreen.routeName,
                        arguments: AppConstants.homeCategories[index].name);
                  },
                  child: CircleAvatar(
                      radius: size.width*0.085,
                      backgroundImage: AssetImage(AppConstants.homeCategories[index].image)),
                ),
                const SizedBox(height: 8.0,),
                SubtitleTextWidget(label: AppConstants.homeCategories[index].name,
                fontSize: size.width*0.032,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          )),
    );
  }
}
