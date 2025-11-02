// ignore: depend_on_referenced_packages
import 'package:math_expressions/math_expressions.dart';

class CalculatorLogics {
  String _expression = '';
  String get expression => _expression;

  void add(String value) {
    _expression += value;
  }

  void clear() {
    _expression = '';
  }

  void delete() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

 String evaluate() {
    if (_expression.isEmpty) return '0';
    
    try {

      String processedExpression = _expression
          .replaceAll('x', '*')
          .replaceAll('÷', '/');
      
      // ignore: deprecated_member_use
      Parser parser = Parser();
      Expression exp = parser.parse(processedExpression);
      
      ContextModel contextModel = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, contextModel);
      
      if (result == result.toInt()) {
        return result.toInt().toString();
      } else {
        return result.toStringAsFixed(2);
      }
    } catch (e) {
      return 'Error';
    }
  }
}
