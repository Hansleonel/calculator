import 'dart:async';

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
      yield CalculatorState(
          firstNumber: '0',
          mathResult: '0',
          secondNumber: '0',
          operation: 'empty');
    } else if (event is AddNumber) {
      yield CalculatorState(
        firstNumber: '0',
        secondNumber: '0',
        operation: 'empty',
        mathResult: (state.mathResult == '0')
            ? event.number
            : state.mathResult + event.number,
      );
    }
  }
}
