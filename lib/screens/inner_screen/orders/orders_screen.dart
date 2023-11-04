import 'package:e_comerce_app/widgets/bag_empty_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/services/assets_manager.dart';
import '../../../core/widget/title_text.dart';
import 'orders_widget.dart';

class OrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreenFree({Key? key}) : super(key: key);

  @override
  State<OrdersScreenFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersScreenFree> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  TitlesTextWidget(
            label: 'Placed orders',
          ),
        ),
        body: isEmptyOrders
            ?Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BagEmptyWidget(
                  imgPath: AssetsManager.orderBag,
                  title: "No orders has been placed yet",
                  subTitle:  "",
                  mediumTitle: '',
                  buttonText: "Shop now"),
            )
            : ListView.separated(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrdersWidgetFree(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ));
  }
}
