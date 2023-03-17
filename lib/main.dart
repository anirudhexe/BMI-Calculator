import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inputpage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF383564),
        appBarTheme: AppBarTheme(
          color: Color(0xFF383564),
        ),
      ),
    );
  }
}


