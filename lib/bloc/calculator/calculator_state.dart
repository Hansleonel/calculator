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

  // creando un nuevo metodo con el nombre de copyWith()
  // este metodo nos permitira devolver el estado anterior de nuestras propieades
  // a menos de que tengan un nuevo valor
  CalculatorState copyWith(
          {String? mathResult,
          String? firstNumber,
          String? secondNumber,
          String? operation}) =>
      CalculatorState(
          // en caso las propiedades tengan un nuevo valor
          // se les asiganara dicho nuevo valor
          // en caso se quiera asignar null es decir no se reciben nuevos valores
          // se asignara el valor anterior con el this.nombrePropiedad
          mathResult: mathResult ?? this.mathResult,
          firstNumber: firstNumber ?? this.firstNumber,
          secondNumber: secondNumber ?? this.secondNumber,
          operation: operation ?? this.operation);
}
