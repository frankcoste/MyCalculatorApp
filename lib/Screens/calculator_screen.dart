
import 'package:my_calculator_app/colors/app_colors.dart';
import 'package:my_calculator_app/utils/calculator_logics.dart';
import 'package:my_calculator_app/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogics logic = CalculatorLogics();
  String userInput = '';
  String result = '0';
@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.displayBackgorund,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  logic.expression,
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.secundaryText,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
      rowButtons([
        {'text': 'C', 'color': AppColors.clearButton, 'flex': 2},
        {'text': 'DEL', 'color': AppColors.delButton},
        {'text': '÷', 'color': AppColors.opertaionButtons},
      ]),
      rowButtons([
        {'text': '7', 'color': AppColors.numericButtons},
        {'text': '8', 'color': AppColors.numericButtons},
        {'text': '9', 'color': AppColors.numericButtons},
        {'text': 'x', 'color': AppColors.opertaionButtons},
      ]),
      rowButtons([
        {'text': '4', 'color': AppColors.numericButtons},
        {'text': '5', 'color': AppColors.numericButtons},
        {'text': '6', 'color': AppColors.numericButtons},
        {'text': '-', 'color': AppColors.opertaionButtons},
      ]),
      rowButtons([
        {'text': '1', 'color': AppColors.numericButtons},
        {'text': '2', 'color': AppColors.numericButtons},
        {'text': '3', 'color': AppColors.numericButtons},
        {'text': '+', 'color': AppColors.opertaionButtons},
      ]),
      rowButtons([
        {'text': '0', 'color': AppColors.numericButtons, 'flex': 2},
        {'text': '.', 'color': AppColors.numericButtons},
        {'text': '=', 'color': AppColors.equalButton},
      ]),
    ],
  );
}

Padding rowButtons(List<Map<String, dynamic>> buttonsData) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 4),
    child: Row(
      children: buttonsData.map((data) {
        final button = CalculatorButton(
          text: data['text'] as String,
          color: data['color'] as Color,
          funcOnPressed: () => buttonPressed(data['text'] as String),
        );

        return Expanded(
          flex: data['flex'] as int? ?? 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: button,
          ),
        );
      }).toList(),
    ),
  );
}
void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        logic.clear();
        result = '0';
      }
      else if(value == 'DEL'){
        logic.delete();
      }
      else if(value == '='){
        result = logic.evaluate();
      }else{
        logic.add(value);
      }
      userInput = logic.expression;
    });
  }
}