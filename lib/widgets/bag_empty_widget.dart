import 'package:flutter/material.dart';
import '../core/widget/subtitle_text.dart';
import '../core/widget/title_text.dart';
import 'custom_button.dart';

class BagEmptyWidget extends StatelessWidget {
  const BagEmptyWidget({super.key,
  required this.buttonText,
    required this.title,
    required this.subTitle,
    required this.imgPath,
    required this.mediumTitle,
  });

  final String imgPath;
  final String title;
  final String mediumTitle;
  final String subTitle;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Image.asset(imgPath,
                fit: BoxFit.contain,
              height: size.height*0.35,
              width: double.infinity,
            ),
          ),
          TitlesTextWidget(label: title, color: Colors.red, fontSize: 36.0),
          const SizedBox(height: 20.0,),
          TitlesTextWidget(label:mediumTitle, fontSize: 20.0),
          const SizedBox(height: 20.0,),
           SubtitleTextWidget(
            label:
                subTitle,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
           SizedBox(height: size.height*0.1),
          CustomButton(
            text: buttonText,
            textColor: Colors.deepPurple,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
