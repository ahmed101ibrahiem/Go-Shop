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
    this.titleSize = 36.0
  });

  final String imgPath;
  final String title;
  final String mediumTitle;
  final String subTitle;
  final String buttonText;
  final double titleSize;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset(imgPath,
                  fit: BoxFit.contain,
                height: size.height*0.34,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16.0,),
            Text( '$title',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red, fontSize: titleSize
            ),),
            const SizedBox(height: 24.0,),
            TitlesTextWidget(label:mediumTitle, fontSize: 20.0),
            const SizedBox(height: 24.0,),
             Center(
               child: SubtitleTextWidget(
                label:
                    subTitle,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                 textAlign: TextAlign.center,
            ),
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
      ),
    );
  }
}
