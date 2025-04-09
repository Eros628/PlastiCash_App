import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_finalprojects/screens/aboutus_screen.dart';
import 'package:flutter_finalprojects/screens/map_screen.dart';
import 'package:flutter_finalprojects/screens/milestone_screen.dart';
import 'package:flutter_finalprojects/screens/profile_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'home_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController2 = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maps"),backgroundColor: Colors.green, toolbarHeight: 40,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: "map",
          child: FlutterMap(
                  mapController: _mapController2,
                  options: MapOptions(
                    initialCenter: const LatLng( 8.5003, 124.7824),
                    initialZoom: 12,
                    minZoom: 0, // Optional: Set a min zoom level
                    maxZoom: 100,
                  ),
                  children: [
                    TileLayer(urlTemplate:'https://tile.openstreetmap.org/{z}/{x}/{y}.png' ,)
                    ,MarkerLayer(markers: [bugoMarker])
                  ],
          ),
        )
      ),
    );
  }
}