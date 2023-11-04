import 'package:e_comerce_app/core/widget/subtitle_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  static const routName = '/privacyPolicyScreen';
  PrivacyPolicyScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(

      appBar: AppBar(
        title: const Text('Privacy & Policy',style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(Icons.arrow_back_ios_new_outlined,color: Theme.of(context).textTheme.titleLarge!.color!,),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin:  EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    color: themeProvider.getIsDarkTheme?Colors.grey.shade800:Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                        thumbColor: MaterialStateProperty.all(Colors.green),
                        // mainAxisMargin: 210.0.h,
                        crossAxisMargin: -4,
                        trackBorderColor: MaterialStateProperty.all(Colors.black),
                        //trackColor: MaterialStateProperty.all(Colors.grey),

                      )
                  ),
                  child: Scrollbar(
                    controller: scrollController,
                    thickness: 8.0,radius:const Radius.circular(16.0),
                    interactive: true,

                    thumbVisibility: true,trackVisibility: true,
                    child: ListView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(decoration: BoxDecoration(
                        ),
                          padding:  const EdgeInsets.only(right: 28.0),
                          child: SubtitleTextWidget(label: '''terms and conditions for an application:

1. Purpose of the application: The application is intended to provide users with a specific set of functionalities, as outlined in the application description on the app store or download page.

2. User Responsibility: Users are responsible for their use of the application and must comply with all applicable laws and regulations. Users must not use the application for any illegal or unauthorized purpose.

3. Data Collection and Use: We collect certain personal information from users, including but not limited to name, email address, and location data. We will use this information in accordance with our privacy policy, which can be found within the application or on our website.
4. Data Collection and Use: We collect certain personal information from users, including but not limited to name, email address, and location data. We will use this information in accordance with our privacy policy, which can be found within the application or on our website.
5. Data Collection and Use: We collect certain personal information from users, including but not limited to name, email address, and location data. We will use this information in accordance with our privacy policy, which can be found within the application or on our website.

6. Prohibited Activities: Users may not use the application to transmit any malware, viruses, or other harmful code. Users may not use the application to harass, bully, or discriminate against other users.''',
                            color: themeProvider.getIsDarkTheme?
                            Colors.white:Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(padding: EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      // agree and contact us button

                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                           //     cubit.agreeCondition(false);
                              },
                              child: Icon(Icons.check_circle,
                                color:Colors.lightGreen,size: 25.0,)),
                          const SizedBox(width: 8.0),
                          RichText(text:  TextSpan(
                              children: [
                                TextSpan(text: 'Agree to',
                                    style: TextStyle(
                                        color:themeProvider.getIsDarkTheme?
                                        Colors.grey.shade700:
                                        Colors.grey.shade700
                                        ,
                                        fontSize: 14)),
                                const TextSpan(text: ' ',),
                                TextSpan(text: 'Privacy & Policy',
                                    style: TextStyle(
                                      color:themeProvider.getIsDarkTheme?
                                      Colors.grey.shade700:
                                      Colors.grey.shade700
                                      ,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Nav to condition screen

                                      }
                                ),
                              ]
                          ))
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      // next button
                      SizedBox(
                        width: double.infinity,
                        height: kBottomNavigationBarHeight-16,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            )
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Confirm',
                          ),
                        ),
                      )

                    ],
                  ),
                ))

          ],
        ),
      ),
    );
  }
}