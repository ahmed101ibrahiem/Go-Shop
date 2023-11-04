import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import '../../core/services/assets_manager.dart';
import '../../core/widget/title_text.dart';
import '../../widgets/bag_empty_widget.dart';
import '../../widgets/search_cart_widget.dart';


class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = '/ViewedRecentlyScreen';
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: BagEmptyWidget(
              imgPath: AssetsManager.shoppingBasket,
              title: "Your Viewed recently is empty",
              subTitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              buttonText: "Shop Now", mediumTitle: '',
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title:  TitlesTextWidget(label: "Viewed recently (5)"),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              itemCount: 220,
              builder: ((context, index) {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchCartWidget(productId: ''),
                );
              }),
              crossAxisCount: 2,
            ),
          );
  }
}
