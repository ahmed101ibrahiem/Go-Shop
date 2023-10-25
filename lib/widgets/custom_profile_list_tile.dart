import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../core/widget/subtitle_text.dart';


class CustomProfileListTitle extends StatelessWidget {
  const CustomProfileListTitle({
    super.key,
    required this.img,
    required this.label,
    required this.function
  });

  final String label;
  final String img;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        function();
      },
      leading:  Image.asset(img, height: 30,),
      title:  SubtitleTextWidget(label: label,),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
