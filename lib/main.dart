import 'package:flutter/material.dart';
import 'package:frest/pages/home.dart';
import 'util/contants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: getThemeData(),
      theme: lightTheme,

      home: const Home(), 
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        appBarTheme: const AppBarTheme(
            color: Colors.blue, iconTheme: IconThemeData(color: Colors.amber)));
  }
}
