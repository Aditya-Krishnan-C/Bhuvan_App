import 'package:flutter/material.dart';

class GeofenceDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geofencing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add logic to set geofence here
                // Call backend or perform necessary actions
              },
              child: Text('Set Geofence'),
            ),
            SizedBox(height: 20),
            Text(
              'Tap the button to set a geofence',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
