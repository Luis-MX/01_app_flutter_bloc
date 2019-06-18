import './../models/openweather_models.dart';
import 'dart:convert';
import 'package:http/http.dart' as Client;

class WeatherClient {
  final String URL_CURRENT_WEATHER = "https://api.openweathermap.org/data/2.5/weather?q=Zacatecas&&APPID=42ce4c6782453a82965563ad555c5528&&units=metric";

  Future<CurrentWeather> obtenerElTiempoActual() async {
    Client.Response respuesta = await Client.get(URL_CURRENT_WEATHER);
    if (respuesta.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(respuesta.body));
    }
    throw Exception("Hubo un error de consulta al servidor");
  }
}