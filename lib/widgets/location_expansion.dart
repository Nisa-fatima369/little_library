import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationExpansionTile extends StatefulWidget {
  TextEditingController addressLineController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  LocationExpansionTile({
    super.key,
    required this.addressLineController,
    required this.cityController,
    required this.postalController,
    required this.stateController,
  });

  @override
  State<LocationExpansionTile> createState() => _LocationExpansionTileState();
}

class _LocationExpansionTileState extends State<LocationExpansionTile> {
  bool isLocationEnabled = false;

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status.isGranted) {
      _handleLocationAccess();
    } else if (status.isDenied) {
      PermissionStatus newStatus = await Permission.location.request();

      if (newStatus.isGranted) {
        _handleLocationAccess();
      } else if (newStatus.isPermanentlyDenied) {
        _showSettingsDialog();
      }
    } else if (status.isPermanentlyDenied) {
      _showSettingsDialog();
    }
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Location Permission"),
          content: const Text(
              "Location permission is required to access this feature. Please grant the permission in app settings."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleLocationAccess() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;

      final placemarkers = await placemarkFromCoordinates(latitude, longitude);
      final addressInfo = placemarkers.first;
      final city = addressInfo.locality;
      final line1 = addressInfo.name;
      final postal = addressInfo.postalCode;
      final state = addressInfo.administrativeArea;

      widget.addressLineController.text = line1 ?? '';
      widget.cityController.text = city ?? '';
      widget.postalController.text = postal ?? '';
      widget.stateController.text = state ?? '';

      setState(() {});
      print("Latitude: $latitude, Longitude: $longitude");
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Set current location as address?',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Switch(
                activeColor: AppColors.success,
                value: isLocationEnabled,
                onChanged: (value) {
                  setState(() {
                    isLocationEnabled = value;
                    if (isLocationEnabled) {
                      _requestLocationPermission();
                    }
                  });
                },
              ),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 20),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
            iconColor: AppColors.primaryText,
            collapsedIconColor: AppColors.primaryText,
            maintainState: true,
            title: Text(
              'Location Address',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              y15,
              Text(
                'Address Line 1',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              y5,
              TextFormField(
                cursorColor: AppColors.primaryText,
                controller: widget.addressLineController,
                decoration: kTextField.copyWith(
                  hintText: 'Street, Address, Company Name, C/O',
                  fillColor: AppColors.grey,
                ),
              ),
              y15,
              Text(
                'City',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              y5,
              TextFormField(
                cursorColor: AppColors.primaryText,
                controller: widget.cityController,
                decoration: kTextField.copyWith(
                  hintText: 'Eg. Desa Tasik',
                  fillColor: AppColors.grey,
                ),
              ),
              y15,
              Text(
                'Postal/Zip Code',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              y5,
              TextFormField(
                cursorColor: AppColors.primaryText,
                controller: widget.postalController,
                decoration: kTextField.copyWith(
                  hintText: 'Eg. 544440',
                  fillColor: AppColors.grey,
                ),
              ),
              y15,
              Text(
                'State',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              y5,
              TextFormField(
                cursorColor: AppColors.primaryText,
                controller: widget.stateController,
                decoration: kTextField.copyWith(
                  hintText: 'Eg. Kuala Lumpur',
                  fillColor: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
