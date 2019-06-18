import 'package:flutter/material.dart';
import './../bloc/bloc.dart';
import './bloc_pantalla.dart';
import './copia_bloc_pantalla.dart';

class PantallaPrincipal extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                child: Icon(Icons.account_circle),
              )
            ),
            ListTile(
              title: Text("Primer ejemplo de BLoC"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (contexto) => PantallaBloc()
                ));
              },
            ),
            ListTile(
              title: Text("Segundo ejemplo de BLoC"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (contexto) => SegundoEjemploBloc()
                ));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Colors.white,
              Colors.orange
            ]
          ),
        ),
        child: Center(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Cudad"),
                    Text("Temperatura"),
                    Text("Descripcion"),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Icon(Icons.cloud),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: blocNumeros.agregar,
      ),
    );
  }
}