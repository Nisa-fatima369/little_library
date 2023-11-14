import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/location_modal.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/slider_card.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _searchController = TextEditingController();
  GoogleMapController? _mapController;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  List<Marker> allMarkers = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    for (var element in locationData) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(element.title),
          draggable: false,
          infoWindow: InfoWindow(title: element.title),
          position: element.locationCoords,
        ),
      );
    }
  }

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

  void _handleLocationAccess() {
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      print("Latitude: $latitude, Longitude: $longitude");
    } catch (e) {
      print("Error getting location: $e");
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
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0XFFFEC260),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(31.416449698574294, 73.06906823633201),
                zoom: 12,
              ),
              markers: Set.from(allMarkers),
              onMapCreated: (controlller) {
                setState(() {
                  _mapController = controlller;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: TextFormField(
              controller: _searchController,
              decoration: kSearchTextField.copyWith(
                filled: true,
                hintText: 'Search for a username',
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.search,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 20,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  tabs.length,
                  (index) {
                    return InkWell(
                      splashColor: AppColors.border,
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: const Duration(microseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? AppColors.primary
                              : AppColors.background2,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Text(
                          tabs[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.secondary),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            height: 200,
            width: MediaQuery.of(context).size.width,
            bottom: 20,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _mapController?.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: locationData[value].locationCoords,
                        zoom: 14.0,
                      ),
                    ),
                  );
                });
              },
              itemCount: locationData.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return const SliderCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
