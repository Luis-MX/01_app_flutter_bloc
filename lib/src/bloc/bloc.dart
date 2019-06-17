import 'dart:async';

class MiBloc {
  StreamController<int> controlador =
      StreamController<int>.broadcast();
  int contador = 1;

  Stream<int> streamNumeros() => controlador.stream;

  void agregar() {
    controlador.sink.add(contador++);
  }

  dispose() {
    controlador.close();
  }
}

final blocNumeros = MiBloc();