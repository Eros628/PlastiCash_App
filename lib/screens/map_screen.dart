import 'package:flutter/material.dart';
import 'package:flutter_finalprojects/main.dart';
import 'package:flutter_finalprojects/screens/home_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredStations = [];
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

  Future<LatLng?> _getLocationFromCityName(String cityName) async {
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$cityName&format=json&limit=1');
    final response = await http.get(url, headers: {
      'User-Agent': 'FlutterApp'
    });
    
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      if(data.isNotEmpty){
        double lat = double.parse(data[0]['lat']);
        double lon = double.parse(data[0]['lon']);
        return LatLng(lat, lon);
      }
    }
    return null;
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

  List <Map<String, dynamic>> stations =[
    {
      'name': 'Bugo Station',
      'location':LatLng(8.5035, 124.7792),
    },
    {
      'name': 'Puerto Station',
      'location' : LatLng(8.4756, 124.7171)
    },

    {
      'name': 'Lapasan Station',
      'location': LatLng(8.480105, 124.6636779)
    }
  ];

  void _onSearchChanged(String query) async{
    if(query.isEmpty){
      setState(() {
        _filteredStations = [];
      });
      return;
    }

    setState(() {
      _filteredStations = stations
      .where((station) => station['name'].toLowerCase().contains(query.toLowerCase()))
      .toList();
    });

  }

  void _onStationSelected(Map<String, dynamic> station){
    _mapController2.move(station['location'], 12);
    _searchController.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _filteredStations =[];
    });
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
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
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
            ),
                
              )
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
          ),
          if (_filteredStations.isNotEmpty)
          Positioned(
            top: 95, // below the search bar
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: _filteredStations.length,
                itemBuilder: (context, index) {
                  final station = _filteredStations[index];
                  return ListTile(
                    title: Text(station['name']),
                    onTap: () => _onStationSelected(station),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white54, 
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                onSubmitted: (value) async {
                  LatLng? loc = await _getLocationFromCityName(value);
                  if (loc != null) {
                    Map<String, dynamic> station = {
                      'name': value,
                      'location': loc,
                    };
                    _onStationSelected(station);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('City not found'), ),
                    );
                  }
                },
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  alignLabelWithHint: true,
                  hintText: 'Search Machine Stations',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
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
          child: Icon(Icons.my_location_outlined, color: const Color.fromARGB(255, 255, 255, 255),size: 30,)
          ),
      ),
    );
  }
}