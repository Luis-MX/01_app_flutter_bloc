import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
class MapaPantalla extends StatefulWidget {
  @override
  _MapaPantallaState createState() => _MapaPantallaState();
}
class _MapaPantallaState extends State<MapaPantalla> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(22.72, -102.57),
        zoom: 13,
        onTap: (LatLng ubicacion) {
          Navigator.of(context).pop(ubicacion);
        }
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        )
      ],
    );
  }
}
