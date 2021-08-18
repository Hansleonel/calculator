import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    // Aqui establecemos la logica haciendo referencia tanto a los eventos como a los estados
    // en este caso al event "CalculatorEvent" como al state "CalculatorState"
    if (event is ResetAC) {
      // cuando queremos crear streams de forma independient
      // como en este caso, para utilizar el yield debemos de agregarle el "*"
      // puesto que queremos devolver el valor que devuelv nuestro Stream y no el Stream en si
      yield* _resetAc();
    } // agregar un numero y que se muestre como mathResult
    else if (event is AddNumber) {
      // usando le metodo con el nombre de copyWith()
      // con la ayuda del "state" que es una instancia al CalculatorState con sus respectivos
      // metodos y propiedades
      // en este caso usaremos el metodo copyWith() y solo la propiedad
      // mathResult puesto que queremos agregar las cifras a dicho parte del Widget donde hacemos referencia al mathResult
      yield state.copyWith(
          // en caso el estado de mathResult sea igual al String '0'
          // entonces le asignamos el mismo valor recibido en este caso el String '0'
          // pero en caso no sea asi, si procedemos a concatenar los valores de state.mathResult
          // con el valor recibido en este caso event.number
          mathResult: (state.mathResult == '0')
              ? event.number
              : state.mathResult + event.number);
    } // Modificr Signmath
    else if (event is SignMath) {
      yield state.copyWith(
          mathResult: (double.parse(state.mathResult) * -1).toString());
    } // Dlt la ultm cifra
    else if (event is DltLstEntry) {
      yield state.copyWith(
          mathResult: state.mathResult.length > 1
              ? state.mathResult.substring(0, state.mathResult.length - 1)
              : '0');
    } // ingresar y mostrar la operacion que se quiere realizar
    else if (event is OperationEntry) {
      yield state.copyWith(
          // recordar cuando queremos usar el valor que teniamos previamente usamos el "state."
          firstNumber: state.mathResult,
          mathResult: '0',
          // recordar cuando queremos usar el nuevo valor debemos de usar el "event."
          operation: event.operation,
          secondNumber: '0');
    } // realizar el calculo de la operacion ingresada con el event "OperationEntry" y con los valores ingresados con el event "AddNumber"
    else if (event is CalculateResult) {
      yield* _calculateResult();
    }
  }

  Stream<CalculatorState> _resetAc() async* {
    yield CalculatorState(
        firstNumber: '0',
        mathResult: '0',
        secondNumber: '0',
        operation: 'empty');
  }

  Stream<CalculatorState> _calculateResult() async* {
    // recordar que como queremos usar los valores que teniamos previamente debemos de usar el ".event"
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    // recodar que como queremos usar el valor de la operacion que teninamos previamente debemos de usar el ".event"
    // no confundir este metodo para calcular resultados "CalculateResult" con el evento con la que ingresamos
    // el tipo de operacion "OperationEntry"
    switch (state.operation) {
      case '+':
        yield state.copyWith(
          secondNumber: state.mathResult,
          mathResult: '${num1 + num2}',
        );
        break;
      default:
        yield state;
    }
  }
}
