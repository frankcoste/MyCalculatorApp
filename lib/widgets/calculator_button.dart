import 'package:my_calculator_app/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String? text;
  final void Function()? funcOnPressed;
  final Color? color;

  const CalculatorButton({
    super.key,
    required this.text,
    this.funcOnPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: funcOnPressed,
          child: Center(
            child: Text(
              text ?? '',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}