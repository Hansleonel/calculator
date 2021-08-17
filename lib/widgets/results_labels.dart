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
        return Column(
          children: [
            SubResult(text: state.firstNumber),
            SubResult(text: state.operation),
            SubResult(text: state.secondNumber),
            LineSeparator(),
            MainResultText(text: state.mathResult),
          ],
        );
      },
    );
  }
}
