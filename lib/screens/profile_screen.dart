import 'package:e_comerce_app/core/services/assets_manager.dart';
import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:e_comerce_app/screens/viewed_recently.dart';
import 'package:e_comerce_app/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../core/services/my_app_method.dart';
import '../core/widget/app_name_text.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_profile_list_tile.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AssetsManager.shoppingCart,
        ),
      ),
        title:const AppNameTextWidget(fontSize: 22.0),
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // text before sign in
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: false,
                child: TitlesTextWidget(label:'Login to save your details, and access your info',
                ),
              ),
            ),
             // user email
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 32.0,
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 27.0,
                        backgroundImage:NetworkImage(
                          'https://image.lexica.art/full_jpg/7515495b-982d-44d2-9931-5a8bbbf27532',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(label:'Ahmed Ibrahim'),
                      const SizedBox(height: 10.0,),
                      const SubtitleTextWidget(label: 'ahmed.elsaba277@gmail.com'),
                    ],
                  ),
                  const SizedBox(width: 4.0,),
                  InkWell(
                    onTap: (){},
                      child: const Icon(IconlyBold.edit)),
                ],
            ),
             ),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TitlesTextWidget(label: 'General'),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CustomProfileListTitle(
                    label: 'All Order',
                    function: (){},
                    img: AssetsManager.orderSvg,
                  ),
                  CustomProfileListTitle(
                    label: 'Wishlist',
                    function: () async {
                      await Navigator.pushNamed(
                        context,
                        WishlistScreen.routName,
                      );
                    },
                    img: AssetsManager.wishlistSvg,
                  ),
                  CustomProfileListTitle(
                    label: 'Viewed recently',
                    function:  () async {
                      await Navigator.pushNamed(
                        context,
                        ViewedRecentlyScreen.routName,
                      );
                    },
                    img: AssetsManager.recent,
                  ),
                  CustomProfileListTitle(
                    label: 'Address',
                    function: (){},
                    img: AssetsManager.address,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TitlesTextWidget(label: 'Settings')),
            const SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SwitchListTile(
                secondary: Image.asset(
                  AssetsManager.theme,
                  height: 30,
                ),
                  title: Text(themeProvider.getIsDarkTheme ? "Dark mode" : "Light mode"),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value){
                    themeProvider.setDarkTheme(themeValue: value);
                  }),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TitlesTextWidget(label: 'Others'),
            ),const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomProfileListTitle(img: AssetsManager.privacy,
                  label: 'Privacy & Policy', function: (){}),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 16,),
            // login button
      Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
          ),
          onPressed:  () async {
            MyAppMethods.showErrorORWarningDialog(
                context: context,
                subtitle: "Are you sure?",
                fct: () {},
                isError: false);
          },
          icon: const Icon(Icons.login),
          label: const Text(
            "Login",
          ),
        ),)
          ],
        ),
      ),
    );
  }
}
