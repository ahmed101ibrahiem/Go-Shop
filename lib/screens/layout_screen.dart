import 'package:e_comerce_app/core/consts/app_colors.dart';
import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:e_comerce_app/screens/cart/cart_screen.dart';
import 'package:e_comerce_app/screens/home_screen.dart';
import 'package:e_comerce_app/screens/profile_screen.dart';
import 'package:e_comerce_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late PageController pageController;
  int currentScreen = 0;
  List<Widget> screens = [
     HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return  Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller:pageController,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          pageController.jumpToPage(currentScreen);
        },
        destinations:  [
          const NavigationDestination(
              icon: Icon(IconlyLight.home),
              label: 'Home',
            selectedIcon: Icon(IconlyBold.home),
          ),
          const NavigationDestination(
            icon: Icon(IconlyLight.search),
            label: 'Search',
            selectedIcon: Icon(IconlyBold.search),
          ),
          NavigationDestination(
            icon: Badge(
              backgroundColor: AppColors.lightGreen,
              label: Text('${cartProvider.getCartItem.length}'),
                child: const Icon(IconlyLight.bag2)),
            label: 'Cart',
            selectedIcon: const Icon(IconlyBold.bag2),
          ),
          const NavigationDestination(
            icon: Icon(IconlyLight.profile),
            label: 'profile',
            selectedIcon: Icon(IconlyBold.profile),
          ),

        ],
      ),
    );
  }
}
