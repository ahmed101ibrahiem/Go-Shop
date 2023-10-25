
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.fontSize= 24.0,
    this.textColor ,
  });
final String text;
Color? backgroundColor;
Color? textColor;
double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        ),
        child: TitlesTextWidget(label: text,color:textColor,));
  }
}
