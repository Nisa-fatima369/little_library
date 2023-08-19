
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    // PermissionStatus permissionStatus = Location()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(31.41633527432525, 73.06958859082539),
          zoom: 12,
        ),
      ),
    );
  }
}
