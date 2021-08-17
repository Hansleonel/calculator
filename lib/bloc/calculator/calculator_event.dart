part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

// como sabemos el evento ResetAC no necesita recibir alguna propiedad o variable
// para poder cumplir con su funcion de borrar todos los numeros y establecerlos como 0
class ResetAC extends CalculatorEvent {}

// como sabemos el evento AddNumber SI necesita recibir alguna propiedad en este caso un numero
// para poder cumplor su funcion de agregar un numero cada vez que se pulse un button de la Applicationn
class AddNumber extends CalculatorEvent {
  final String number;
  // como vemos el constructor nos dice que tiene que recibir un valor para poder usar este event
  // ya que la varianle "number" tiene que ser inicializada o tener un constructor
  AddNumber(this.number);
}
