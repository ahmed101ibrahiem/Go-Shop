import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Hello World',style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w800,
            ),),
            ElevatedButton(onPressed: (){}, child: const Text(
              'Hello world',
            )),
            SwitchListTile(
              title: Text(themeProvider.getIsDarkTheme ? "Dark mode" : "Light mode"),
                value: themeProvider.getIsDarkTheme,
                onChanged: (value){
                  themeProvider.setDarkTheme(themeValue: value);
                })
          ],
        ),
      ),
    );
  }
}
