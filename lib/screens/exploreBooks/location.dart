import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/location_modal.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/slider_card.dart';

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
  @override
  void initState() {
    super.initState();
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
            left: 12,
            right: 0,
            child: DefaultTabController(
              length: tabs.length,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(22),
                ),
                splashBorderRadius: BorderRadius.circular(28),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                isScrollable: true,
                unselectedLabelColor: AppColors.primaryText,
                labelColor: AppColors.primaryText,
                tabs: tabs
                    .map((String name) => Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              name,
                            ),
                          ),
                        ))
                    .toList(),
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
