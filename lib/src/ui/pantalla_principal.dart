import 'package:flutter/material.dart';
import './../bloc/bloc.dart';
import './bloc_pantalla.dart';
import './copia_bloc_pantalla.dart';
import './../bloc/weather_bloc.dart';
import './../models/openweather_models.dart';

class PantallaPrincipal extends StatelessWidget {
  Widget build(BuildContext context) {
    weatherBloc.obtenerElTiempoActual();
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
      body: StreamBuilder(
        stream: weatherBloc.streamCurrentWeather(),
        builder: (ctx, AsyncSnapshot<CurrentWeather> respuesta) {
          if (respuesta.hasData) {
            return Container(
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
                          Text("Cudad: ${respuesta.data.nombreUbicacion}"),
                          Text("Temperatura: ${respuesta.data.temperatura} °C"),
                          Text(respuesta.data.descripcion),
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: blocNumeros.agregar,
      ),
    );
  }
}