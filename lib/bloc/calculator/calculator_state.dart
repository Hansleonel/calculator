part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  // Constructor que inicializa los valores de nuestras propiedades que establecen
  // el primer state o estado inicial de la application
  CalculatorState(
      {this.mathResult = '30',
      this.firstNumber = '10',
      this.secondNumber = '20',
      this.operation = '+'});
}
