import 'dart:async';
import 'dart:io';

import 'package:calculater_console/calculater_console.dart';

void main(List<String> arguments) async {
  final calculator = Calculator();

  print('Enter first number:');
  final num1Str = stdin.readLineSync();
  print('Enter operator (+, -, *, /):');
  final operator = stdin.readLineSync();
  print('Enter second number:');
  final num2Str = stdin.readLineSync();

  try {
    final num1 = double.parse(num1Str!);
    final num2 = double.parse(num2Str!);

    double result;
    switch (operator) {
      case '+':
        result = calculator.add(num1, num2);
        break;
      case '-':
        result = calculator.subtract(num1, num2);
        break;
      case '*':
        result = calculator.multiply(num1, num2);
        break;
      case '/':
        result = calculator.divide(num1, num2);
        break;
      default:
        throw FormatException('Invalid operator');
    }

    await Future.delayed(Duration(seconds: 5));
    print('Result: $result');
  } on FormatException catch (e) {
    print('Error: Invalid input - ${e.message}');
  } on IntegerDivisionByZeroException {
    print('Error: Division by zero');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
