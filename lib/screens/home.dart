import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:testapp/screens/bhuvan2d.dart';
import 'package:testapp/screens/chatbot.dart';
import 'package:testapp/screens/geofencing.dart';
import 'package:testapp/screens/hfa.dart';
import 'package:testapp/screens/mgnrega.dart';
import 'package:testapp/screens/settings.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MapController _mapController = MapController();
  LatLng currentLocation = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Abhinav'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notification button logic here
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        icon: Icon(Icons.chat),
        label: Text('With Dhruv'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('HFA'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => hfa(),
                    ));
                // handle HFA button press
              },
            ),
            ListTile(
              title: Text('MGNREGA'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myappp(),
                    ));
                // handle MGNREGA button press
              },
            ),
            ListTile(
              title: Text('JUMP'),
              onTap: () {
                // handle JUMP button press
              },
            ),
            ListTile(
              title: Text('FASAL'),
              onTap: () {
                // handle FASAL button press
              },
            ),
            ListTile(
              title: Text('Aquifer'),
              onTap: () {
                // handle Aquifer button press
              },
            ),
            ListTile(
              title: Text('Bhuvan 2D'),
              onTap: () {
                // handle Aquifer button press
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BhuvanMapScreen(),
                    ));
              },
            ),
            ListTile(
              title: Text('GeoFencing'),
              onTap: () {
                // handle Aquifer button press
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeofenceDemo(),
                    ));
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
                // handle Settings button press
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search anything',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      // Add your logic for text-to-voice interaction
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:
                currentLocation.latitude != 0 && currentLocation.longitude != 0
                    ? FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          initialCenter: currentLocation,
                          initialZoom: 15.0,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          ),
                          MarkerLayer(markers: [
                            Marker(
                              point: currentLocation,
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            )
                          ])
                        ],
                      )
                    : Center(
                        child:
                            CircularProgressIndicator(), // Show a loading indicator while waiting for the location
                      ),
          ),
        ],
      ),
    );
  }
}
