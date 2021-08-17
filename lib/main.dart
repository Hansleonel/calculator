import 'package:calculator_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_bloc/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AppState());
}

// al igual que con provider debemos de ubicar nuestro bloc de acuerdo al alcance que se quiera tener
// en este caso ubicaremos este bloc en la parte mas alta de la aplicacion
// lo cual nos permitira acceder a dicho bloc desde cualquiera parte de la aplicacion
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // la propiedad providers recibe los bloc que necesitamos utilizar a este nivel
    return MultiBlocProvider(providers: [
      BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc())
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Bloc',
      home: CalculatorScreen(),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    );
  }
}
