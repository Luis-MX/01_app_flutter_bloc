import 'package:flutter/material.dart';
import './../bloc/bloc.dart';
import './bloc_pantalla.dart';
import './copia_bloc_pantalla.dart';
import './../bloc/weather_bloc.dart';
import './../models/openweather_models.dart';
import './mapa_pantalla.dart';

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
                gradient: RadialGradient(
                  center: AlignmentDirectional.topCenter,
                    radius: 4,
                    stops: [
                      0.0, 0.4
                    ],
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
                      child: Image.network(
                          respuesta.data.urlIcono,
                      ),
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
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MapaPantalla()
          ));
        },
      ),
    );
  }
}