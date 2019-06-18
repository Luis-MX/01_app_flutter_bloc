import 'dart:async';
import './../models/openweather_models.dart';
import './../resources/weather_api_client.dart';

class WeatherBloc {
  StreamController<CurrentWeather> _controladorStream =
      StreamController.broadcast();
  WeatherClient _cliente = WeatherClient();

  Stream<CurrentWeather> streamCurrentWeather() => _controladorStream.stream;

  void obtenerElTiempoActual() {
    _cliente.obtenerElTiempoActual().then((CurrentWeather evento) {
      _controladorStream.sink.add(evento);
    });
  }

  dispose() {
    _controladorStream.close();
  }
}

final weatherBloc = WeatherBloc();