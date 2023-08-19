 
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide Location;

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        
        initialCameraPosition: CameraPosition(
          target: LatLng(30.1575, 71.5249),
          zoom: 11,
        ),
      ),
    );
  }
}
