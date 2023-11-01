import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class CustomFavoriteWidget extends StatefulWidget {
  const CustomFavoriteWidget({
    super.key,
    this.color = Colors.transparent,
    this.size = 22,
  });

  final Color color;
  final double size;
  @override
  State<CustomFavoriteWidget> createState() => _CustomFavoriteWidgetState();
}

class _CustomFavoriteWidgetState extends State<CustomFavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        shape:  BoxShape.circle,
      ),
      child: IconButton(icon:  Icon(IconlyLight.heart,size: widget.size,),
          onPressed: (){}),
    );
  }
}
