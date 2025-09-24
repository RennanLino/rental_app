import 'package:flutter/material.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/presenter/pages/movie_details_page.dart';
import 'package:rental_app/src/presenter/pages/movies_page.dart';
import 'package:rental_app/src/presenter/pages/login_page.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 30.0,
            color: HexColorHelper.fromHex(textColor),
          ),
          bodyMedium: TextStyle(
            fontSize: 20.0,
            color: HexColorHelper.fromHex(textColor),
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            color: HexColorHelper.fromHex(textColor),
          ),
          headlineLarge: TextStyle(
            fontSize: 40.0,
            color: HexColorHelper.fromHex(textColor),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
