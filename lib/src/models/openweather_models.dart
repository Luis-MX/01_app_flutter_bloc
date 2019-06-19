
class CurrentWeather {
  double latitud;
  double longitud;
  String descripcion;
  double temperatura;
  String nombreUbicacion;
  String urlIcono;

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonCoordenadas = Map.of(json["coord"]);
    if (jsonCoordenadas["lat"].runtimeType == double)
      latitud = jsonCoordenadas["lat"];
    else{
      int lat = jsonCoordenadas["lat"];
      latitud = lat.toDouble();
    }
    if (jsonCoordenadas["lon"].runtimeType == double)
      longitud = jsonCoordenadas["lon"];
    else{
      int lon = jsonCoordenadas["lon"];
      latitud = lon.toDouble();
    }
    List jsonListWeather = json["weather"] as List;
    Map<String, dynamic> jsonWeather = Map.of(jsonListWeather[0]);
    descripcion = "${jsonWeather['main']}: ${jsonWeather['description']}";
    urlIcono = "http://openweathermap.org/img/w/${jsonWeather['icon']}.png";
    Map<String, dynamic> jsonTemperatura = Map.of(json["main"]);
    print(jsonTemperatura["temp"].runtimeType);
    if (jsonTemperatura["temp"].runtimeType == double)
      temperatura = jsonTemperatura["temp"];
    else{
      int temp = jsonTemperatura["temp"];
      temperatura = temp.toDouble();
    }
    nombreUbicacion = json["name"];
  }
}