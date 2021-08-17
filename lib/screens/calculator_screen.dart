import 'package:calculator_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Referencia al bloc que sera utilizado que como vemos
    // es muy parecida a la referencia cuando hacemos uso del manejador de estados
    // Provider
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(child: Container()),
              // labels de resultados
              ResultLabels(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    bgColor: Color(0xffA5A5A5),
                    // como vemos en este caso al momento de pulsr este button queremos
                    // que los valores de la calculador se restablescan a 0
                    // para esto lo primero que debemos de realizar es usar la referencia al "BlocProvider"
                    // y especificar cual de los Bloc creados se utilizara en este caso CalculatorBloc
                    // ademas debemos de especifcar cual de los eventos debemos de usar
                    // en este caso para restabliecer a 0 a todos los valores debemos de usar el evento ResetAC()
                    onPressed: () => calculatorBloc.add(ResetAC()),
                  ),
                  CalculatorButton(
                    text: '+/-',
                    bgColor: Color(0xffA5A5A5),
                    onPressed: () => print('+/-'),
                  ),
                  CalculatorButton(
                    text: 'del',
                    bgColor: Color(0xffA5A5A5),
                    onPressed: () => print('del'),
                  ),
                  CalculatorButton(
                    text: '/',
                    bgColor: Color(0xffF0A23B),
                    onPressed: () => print('/'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '7',
                    // como vemos en este caso al momento de pulsr este button queremos que el valor
                    // de 7 se agrege a la linea donde aparecen los resultados
                    // para esto lo primero que debemos de realizar es el uso de la referencia a BlocProvider
                    // y especificar a cual de los eventos debemos de usar, en este caso el evento AddNumber()
                    // que como sabemos la creamos para que reciba un valor posicional que en este caso sera 7
                    onPressed: () => calculatorBloc.add(AddNumber('7')),
                  ),
                  CalculatorButton(
                    text: '8',
                    onPressed: () => calculatorBloc.add(AddNumber('8')),
                  ),
                  CalculatorButton(
                    text: '9',
                    onPressed: () => calculatorBloc.add(AddNumber('9')),
                  ),
                  CalculatorButton(
                    text: 'X',
                    bgColor: Color(0xffF0A23B),
                    onPressed: () => print('X'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '4',
                    onPressed: () => print('4'),
                  ),
                  CalculatorButton(
                    text: '5',
                    onPressed: () => print('5'),
                  ),
                  CalculatorButton(
                    text: '6',
                    onPressed: () => print('6'),
                  ),
                  CalculatorButton(
                    text: '-',
                    bgColor: Color(0xffF0A23B),
                    onPressed: () => print('-'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '1',
                    onPressed: () => print('1'),
                  ),
                  CalculatorButton(
                    text: '2',
                    onPressed: () => print('2'),
                  ),
                  CalculatorButton(
                    text: '3',
                    onPressed: () => print('3'),
                  ),
                  CalculatorButton(
                    text: '+',
                    bgColor: Color(0xffF0A23B),
                    onPressed: () => print('+'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '0',
                    big: true,
                    onPressed: () => print('0'),
                  ),
                  CalculatorButton(
                    text: '.',
                    onPressed: () => print('.'),
                  ),
                  CalculatorButton(
                    text: '=',
                    bgColor: Color(0xffF0A23B),
                    onPressed: () => print('='),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
