import 'package:flutter/material.dart';
import './../bloc/bloc.dart';
import './bloc_pantalla.dart';
import './copia_bloc_pantalla.dart';
import './../bloc/weather_bloc.dart';
import './../models/openweather_models.dart';
import './mapa_pantalla.dart';
import 'package:latlong/latlong.dart';

class PantallaPrincipal extends StatelessWidget {
  List<Color> colores = [
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.red
  ];
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
            Color color;
            double temperatura = respuesta.data.temperatura;
            if (temperatura < 15.0)
              color = colores[0];
            else if (temperatura < 25)
              color = colores[1];
            else if (temperatura < 40)
              color = colores[2];
            else color = colores[3];
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
                      color
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
                        fit: BoxFit.fill
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
        onPressed: () async {
          LatLng ubicacion = await Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MapaPantalla()
          ));
          if (ubicacion != null)
            weatherBloc.obtenerElTiempoActualEn(ubicacion);
        },
      ),
    );
  }
}