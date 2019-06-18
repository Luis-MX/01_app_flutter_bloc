import 'package:flutter/material.dart';
import './../bloc/bloc.dart';

class PantallaBloc extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla BLoC Incremento"),
      ),
      body: StreamBuilder(
          builder: (BuildContext contextoLocal, AsyncSnapshot<int> dato){
            return Center(
              child: Text("${dato.data}", style: TextStyle(fontSize: 30),),
            );
          },
          stream: blocNumeros.streamNumeros()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: blocNumeros.agregar,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}