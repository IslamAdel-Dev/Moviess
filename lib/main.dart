import 'package:flutter/material.dart';
import 'package:movies/screens/intro_screen.dart';
import 'package:movies/tabs/home_tab.dart';

void main() {
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeTab.routename: (_) => HomeTab(),
        IntroPageScreen.routeName: (_) => IntroPageScreen()
      },
      initialRoute: IntroPageScreen.routeName,
    );
  }
}
/*
void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routename,
      theme: Apptheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}


  
  */
