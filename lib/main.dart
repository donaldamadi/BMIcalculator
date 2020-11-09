import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/resultsPage' : (context) => ResultsPage()
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        primaryColor: Color(0xFF0A0D22),
      ),
      debugShowCheckedModeBanner: false,
      // home: InputPage(),
    );
  }
}
