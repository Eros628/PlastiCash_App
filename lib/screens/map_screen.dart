import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/screens/aboutus_screen.dart';
import 'package:flutter_finalprojects/screens/map_screen.dart';
import 'package:flutter_finalprojects/screens/milestone_screen.dart';
import 'package:flutter_finalprojects/screens/profile_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'home_screen.dart';
import 'package:geolocator/geolocator.dart';






class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController2 = MapController();
  LatLng? userLocation;

  Future<void> _handleLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;
  }


   Future<LatLng?> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings:  LocationSettings(
          accuracy: LocationAccuracy.high
        ),
      );
      return LatLng(position.latitude, position.longitude);
    } 
      catch (e) {
       if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
       }
      return null;
    }
  }


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          SizedBox(
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
                      ,
                      MarkerLayer(
                        markers: [bugoMarker,
                          if(userLocation != null)
                          Marker(
                            point: userLocation!,
                            width: 50,
                            height: 50,
                            child: Icon(Icons.person_pin_circle_rounded, size: 40, color: Colors.blue.shade500),
                          ),
                        ],
                ),
                    ],
                    
                ),
                
              )
          ),
      ]),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100, right: 10),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: ()async{
            await _handleLocationPermission();
            LatLng? location= await _getCurrentLocation();
            
            if(location != null){
              setState(() {
                userLocation= location;
              });
              _mapController2.move(userLocation!,9);
            }
          },
          backgroundColor:  Color.fromARGB(255, 27, 75, 61),
          focusColor: Colors.red,
          child: Icon(Icons.my_location_outlined, color: const Color.fromARGB(255, 255, 255, 255),size: 30,)
          ),
      ),
    );
  }
}