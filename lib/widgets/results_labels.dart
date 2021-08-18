import 'package:calculator_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets.dart';

class ResultLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // como vemos si queiremos hacer uso del bloc debemos de utilizar el Widget BlocBuilder<NombreBLoc, NombreState>()
    // y como vemos debemos de especificar tanto el nombre del bloc a utilizar asi como el nombre del State a utilizar
    // en este caso CalculatorBloc y CalcultorState
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state.firstNumber == '0' && state.secondNumber == '0') {
          return MainResultText(
              text: state.mathResult.endsWith('.0')
                  ? state.mathResult.substring(0, state.mathResult.length - 2)
                  : state.mathResult);
        }

        return Column(
          children: [
            // como vemos en esta parte mostramos los valores que almacenamos en el state
            // en este caso especificamos previamente que es de tipo CalculatorState
            SubResult(text: state.firstNumber),
            SubResult(text: state.operation),
            SubResult(
                text: state.secondNumber.endsWith('.0')
                    ? state.secondNumber
                        .substring(0, state.secondNumber.length - 2)
                    : state.secondNumber),
            LineSeparator(),
            MainResultText(
                text: state.mathResult.endsWith('.0')
                    ? state.mathResult.substring(0, state.mathResult.length - 2)
                    : state.mathResult),
          ],
        );
      },
    );
  }
}
