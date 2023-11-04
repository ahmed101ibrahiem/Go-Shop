import 'package:card_swiper/card_swiper.dart';
import 'package:e_comerce_app/core/consts/app_constants.dart';
import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:e_comerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/services/assets_manager.dart';
import '../core/widget/app_name_text.dart';
import '../widgets/home_categories_widget.dart';
import '../widgets/home_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(fontSize: 20),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.24,
                child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstants.bannersImages.length,
                    autoplay: true,
                    duration: 500,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Colors.red,
                      ),
                    )),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TitlesTextWidget(
                label: 'Latest arrival',fontSize: 22.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: size.height*0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: productProvider.getProducts[index],
                        child: const LatestArrivalCardWidget());
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TitlesTextWidget(
                label: 'Categories',
                fontSize: 22.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const HomeCategoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}

