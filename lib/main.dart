import 'package:flutter/material.dart';
import 'package:news_app/modules/home/screens/settings_screen.dart';
import 'package:news_app/modules/splash/splash_screen.dart';

import 'modules/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
