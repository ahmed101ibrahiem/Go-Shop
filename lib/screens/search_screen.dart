import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_comerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/services/assets_manager.dart';
import '../core/widget/title_text.dart';
import '../models/product_model.dart';
import '../widgets/bag_empty_widget.dart';
import '../widgets/search_cart_widget.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<ProductModel> searchListProduct = [];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final ctgName = ModalRoute.of(context)!.settings.arguments as String?;
    final ctgProducts= ctgName == null?productProvider.getProducts:
    productProvider.findByCategory(ctgName: ctgName);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TitlesTextWidget(label:ctgName?? "Store product"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: ctgProducts.isEmpty?
        BagEmptyWidget(
          imgPath: AssetsManager.shoppingBasket,
          title: "OOPS",
          subTitle:
          'No Product yet try another product',
          buttonText: "Shop Now", mediumTitle: '',
        ):Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0,),
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'search',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      searchTextController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
                onChanged: (value) {
                    searchListProduct =
                        productProvider.searchProducts(
                            searchText: searchTextController.text,
                           specificProducts: ctgProducts
                        );
                },
                onSubmitted: (value) {
                    searchListProduct = productProvider.searchProducts(
                        searchText: searchTextController.text,
                    specificProducts: ctgProducts
                    );
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              if(searchListProduct.isEmpty&&searchTextController.text.isNotEmpty)...[
                const Opacity(
                  opacity: 0.6,
                  child: Text('No Result Found',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),),
                )
              ],
              Expanded(
                  child: DynamicHeightGridView(
                itemCount:searchTextController.text.isNotEmpty?searchListProduct.length: ctgProducts.length,
                crossAxisCount: 2,
                builder: (context, index) {
                  return SearchCartWidget(
                    productId:searchTextController.text.isNotEmpty?searchListProduct[index].productId:
                    ctgProducts[index].productId,
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
