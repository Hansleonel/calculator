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

// como vemos el evento SignMath no necesita recibir alguna propieadad adicional puesto que se sabe
// que ya se tiene el valor de la cifra que se quiere cmbr y toda la logica se realiza en el bloc
class SignMath extends CalculatorEvent {}

class DltLstEntry extends CalculatorEvent {}

// como vemos este evento nos permitira ingresar el signo de la operacion que se quiere realizar
// ya sea suma, rest, multi, divition
class OperationEntry extends CalculatorEvent {
  final String operation;
  OperationEntry(this.operation);
}

// como vemos este evento nos permitira calcular el resultado de la operacion recibida con el evento OperationEntry y
// con los valores tambien recibidos con el evento AddNumber
class CalculateResult extends CalculatorEvent {}
