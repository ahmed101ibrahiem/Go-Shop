import 'package:flutter/cupertino.dart';

class TitlesTextWidget extends StatelessWidget {
   TitlesTextWidget({
    Key? key,
    required this.label,
    this.fontSize = 20,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
  }) : super(key: key);

  final TextOverflow overflow;
  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      // textAlign: TextAlign.justify,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          overflow: overflow),
    );
  }
}
