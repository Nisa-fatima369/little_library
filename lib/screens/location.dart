import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide Location;
import 'package:little_library/constants.dart';
import 'package:little_library/modal/location_modal.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/book_card.dart';
import 'package:little_library/theme/colors.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _searchController = TextEditingController();
  GoogleMapController? _mapController;
  PageController _pageController = PageController();
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
    _pageController = PageController(initialPage: 1, viewportFraction: 0.9);
  }

  _locationDataList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        Size size = MediaQuery.of(context).size;
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 * (value.abs() * 0.3) + 0.6.clamp(0.0, 1.0));
        }
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: size.height * 0.2,
            child: widget,
          ),
        );
      },
      child: const Stack(
        children: [
          SliderCard(),
        ],
      ),
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
            top: 150,
            left: 0,
            right: 0,
            child: DefaultTabController(
              length: tabs.length,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(22),
                ),
                isScrollable: true,
                unselectedLabelColor: AppColors.primaryText,
                labelColor: AppColors.primaryText,
                tabs: tabs
                    .map((String name) => Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.background2,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.background2,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: AppColors.background1),
                              ],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                name,
                              ),
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
              itemCount: locationData.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return _locationDataList(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
