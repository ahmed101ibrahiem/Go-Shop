import 'package:e_comerce_app/providers/theme_provider.dart';
import 'package:e_comerce_app/screens/auth/register.dart';
import 'package:e_comerce_app/screens/details_screen.dart';
import 'package:e_comerce_app/screens/home_screen.dart';
import 'package:e_comerce_app/screens/layout_screen.dart';
import 'package:e_comerce_app/screens/viewed_recently.dart';
import 'package:e_comerce_app/screens/wishlist.dart';
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
      ],
      child: Consumer<ThemeProvider>(builder: (
          context,
          themeProvider,
          child,
          ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop Smart',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home:  const LayoutScreen(),
          routes: {
            ProductDetailsScreen.routName: (context) => const ProductDetailsScreen(),
            WishlistScreen.routName: (context) => const WishlistScreen(),
            ViewedRecentlyScreen.routName: (context) =>
            const ViewedRecentlyScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
          },
        );
      }),
    );
  }
}
