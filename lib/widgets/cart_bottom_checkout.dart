import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:flutter/material.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 10,
      padding:  const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10.0),
      decoration:BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,
      border: const Border(top: BorderSide(width: 1,color: Colors.grey))
      ),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(child: TitlesTextWidget(label: 'Total (6 products/6 Items)')),
              const  Spacer(),
                const SubtitleTextWidget(label: '16.99\$',color: Colors.blue,)
              ],
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Checkout'))
        ],
      ),
    );
  }
}
