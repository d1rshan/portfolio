import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        fontFamily: 'SuisseIntl',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(151, 150, 150, 1),
          ),
        ),
      ),
      title: "Darshan's Portfolio",
      home: HomePage(),
    );
  }
}
