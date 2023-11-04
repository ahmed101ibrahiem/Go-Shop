import 'package:e_comerce_app/providers/cart_provider.dart';
import 'package:e_comerce_app/providers/product_provider.dart';
import 'package:e_comerce_app/providers/theme_provider.dart';
import 'package:e_comerce_app/screens/auth/forgot_password.dart';
import 'package:e_comerce_app/screens/auth/login.dart';
import 'package:e_comerce_app/screens/auth/register.dart';
import 'package:e_comerce_app/screens/inner_screen/details_screen.dart';
import 'package:e_comerce_app/screens/inner_screen/orders/orders_screen.dart';
import 'package:e_comerce_app/screens/inner_screen/privacy_policy_screen.dart';
import 'package:e_comerce_app/screens/layout_screen.dart';
import 'package:e_comerce_app/screens/inner_screen/viewed_recently.dart';
import 'package:e_comerce_app/screens/inner_screen/wishlist.dart';
import 'package:e_comerce_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/consts/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (
          context,
          themeProvider,
          child,
          ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Go Shop',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home:  const LayoutScreen(),
          routes: {
            ProductDetailsScreen.routName: (context) => const ProductDetailsScreen(),
            WishlistScreen.routName: (context) => const WishlistScreen(),
            ViewedRecentlyScreen.routName: (context) =>
            const ViewedRecentlyScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
            LoginScreen.routName: (context) => const LoginScreen(),
            PrivacyPolicyScreen.routName: (context) =>  PrivacyPolicyScreen(),
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
            SearchScreen.routeName: (context) =>
            const SearchScreen(),
          },
        );
      }),
    );
  }
}
