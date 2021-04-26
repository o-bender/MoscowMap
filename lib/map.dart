import 'package:moscow_map/msk77_projection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MoscowMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      key: Key('map'),
      options: MapOptions(
          crs: MSK77crc,
          center: LatLng(55.8143020, 37.8404948),
          zoom: 10.0,
          minZoom: 1.0,
          maxZoom: maxZoom
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://apieatlas.mos.ru/arcgis/rest/services/egko_122018/MapServer/tile/{z}/{y}/{x}",
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 65.0,
              height: 65.0,
              point: LatLng(55.8143020, 37.8404948),
              builder: (ctx) => Container(
                child: Icon(
                    Icons.location_pin,
                    color: Colors.blueAccent,
                    size: 65
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}