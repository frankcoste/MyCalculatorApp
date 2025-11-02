import 'package:my_calculator_app/Screens/calculator_screen.dart';
import 'package:my_calculator_app/colors/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.principalBackgorund,
        appBar: AppBar(
          backgroundColor: AppColors.principalBackgorund,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Calculator',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        body: CalculatorScreen(),
      ),
    );
  }
}
