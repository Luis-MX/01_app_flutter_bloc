import 'dart:convert';

class CurrentWeather {
  double latitud;
  double longitud;
  String descripcion;
  int temperatura;
  String nombreUbicacion;
  String urlIcono;

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonCoordenadas = Map.of(json["coord"]);
    latitud = jsonCoordenadas["lat"];
    longitud = jsonCoordenadas["lon"];
    List jsonListWeather = json["weather"] as List;
    Map<String, dynamic> jsonWeather = Map.of(jsonListWeather[0]);
    descripcion = "${jsonWeather['main']}: ${jsonWeather['description']}";
    urlIcono = "http://openweathermap.org/img/w/${jsonWeather['icon']}.png";
    Map<String, dynamic> jsonTemperatura = Map.of(json["main"]);
    temperatura = jsonTemperatura["temp"];
    nombreUbicacion = json["name"];
  }
}