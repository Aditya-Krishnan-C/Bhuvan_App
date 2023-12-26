import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';

class GPSAccuracy extends StatelessWidget {
  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double accuracy = position.accuracy;

      print('Latitude: ${position.latitude}');
      print('Longitude: ${position.longitude}');
      print('Accuracy: ${accuracy.toStringAsFixed(2)} meters');
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  const GPSAccuracy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: getLocation,
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
