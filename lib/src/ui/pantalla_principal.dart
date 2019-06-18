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
      body: Center(
        child: Text("OpenWeather API"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: blocNumeros.agregar,
      ),
    );
  }
}