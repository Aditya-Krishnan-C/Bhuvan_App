import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BhuvanMapScreen extends StatelessWidget {
  const BhuvanMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bhuvan Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(11.321972846984863, 75.93538665771484),
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://bhuvan-vec2.nrsc.gov.in/bhuvan/wms?service=WMS&version=1.1.1&request=GetMap&layers=lulc:BR_LULC50K_1112&styles=&bbox=83.323,24.286,88.298,27.521&width=256&height=256&srs=EPSG:4326&format=image/png',
            subdomains: ['a', 'b', 'c'],
          )
        ],
      ),
    );
  }
}
