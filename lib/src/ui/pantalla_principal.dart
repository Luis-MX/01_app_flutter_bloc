import 'package:flutter/material.dart';
import './../bloc/bloc.dart';

class PantallaPrincipal extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla Principal"),
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
    );
  }
}