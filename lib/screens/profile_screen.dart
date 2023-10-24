import 'package:e_comerce_app/core/services/assets_manager.dart';
import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:e_comerce_app/core/widget/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(leading: Image.asset(AssetsManager.shoppingCart,
      ),
        title: const Text('Go Shop'),
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
                  const SizedBox(width: 7.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(label:'Ahmed Ibrahim'),
                      const SizedBox(height: 10.0,),
                      const SubtitleTextWidget(label: 'ahmed.elsaba277@gmail.com'),
                    ],
                  ),
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
                    function: (){},
                    img: AssetsManager.wishlistSvg,
                  ),
                  CustomProfileListTitle(
                    label: 'Viewed recently',
                    function: (){},
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
                onPressed: () {},
                icon: const Icon(Icons.login),
                label: const Text(
                  "Login",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProfileListTitle extends StatelessWidget {
  const CustomProfileListTitle({
    super.key,
    required this.img,
    required this.label,
    required this.function
  });

  final String label;
  final String img;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        function();
      },
      leading:  Image.asset(img, height: 30,),
      title:  SubtitleTextWidget(label: label,),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
