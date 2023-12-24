import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/modal/user.modal.dart';

import 'package:little_library/screens/HomePage/description.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/status_pills.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  final Book? book;
  const Location({super.key, this.book});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final TextEditingController _searchController = TextEditingController();
  late GoogleMapController _mapController;
  Future<Position> position = Geolocator.getCurrentPosition();
  int currentIndex = 0;
  String? selectedCategory;
  UserModel? user;
  bool isBookMarked = false;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _getCurrentLocation();
  }

  Future _requestLocationPermission() async {
    var permission = await Permission.location.status;
    if (permission.isGranted) {
      _handleLocationAccess();
    } else if (permission.isDenied) {
      _requestLocationPermission();
    } else if (permission.isPermanentlyDenied) {
      _showSettingsDialog();
    }
  }

  void _handleLocationAccess() {
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition();

      double latitude = position.latitude;
      double longitude = position.longitude;
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
      body: FutureBuilder(
        future: selectedCategory != null
            ? FirebaseFirestore.instance
                .collection('books')
                .where('bookCategory', isEqualTo: selectedCategory)
                .get()
                .then((value) =>
                    value.docs.map((e) => Book.fromMap(e.data())).toList())
            : FirebaseFirestore.instance.collection('books').get().then(
                (value) =>
                    value.docs.map((e) => Book.fromMap(e.data())).toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Book> books = snapshot.data!;
            if (_searchController.text.isNotEmpty) {
              books = books
                  .where((element) => element.bookName!
                      .toLowerCase()
                      .contains(_searchController.text.toLowerCase()))
                  .toList();
            }

            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(31.4107387, 73.0914206),
                      zoom: 14,
                    ),
                    markers: books
                        .asMap()
                        .entries
                        .map(
                          (books) => Marker(
                            infoWindow: InfoWindow(
                                title: books.value.bookName,                        
                                ),
                            position: LatLng(
                              books.value.locationCoordinates!.latitude,
                              books.value.locationCoordinates!.longitude,
                            ),
                            icon: BitmapDescriptor.defaultMarker,
                            markerId: MarkerId('${books.key}'),
                          ),
                        )
                        .toSet(),
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
                    cursorColor: AppColors.primaryText,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: kSearchTextField.copyWith(
                      filled: true,
                      hintText: 'Search for a book',
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
                                if (tabs[index] == 'All') {
                                  selectedCategory = null;
                                } else {
                                  selectedCategory = tabs[index];
                                }
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
                  child: SizedBox(
                    height: 200,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          _mapController.moveCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                    books[value].locationCoordinates!.latitude,
                                    books[value]
                                        .locationCoordinates!
                                        .longitude),
                                zoom: 14.0,
                              ),
                            ),
                          );
                        });
                      },
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return BookDetail(
                                  book: books[index],
                                );
                              }),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              books[index].bookName ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            y5,
                                            Text(
                                              books[index].bookDescription ??
                                                  '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: AppColors
                                                          .placeholderText),
                                            ),
                                            y5,
                                            FutureBuilder(
                                              future: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(books[index].bookOwnerId)
                                                  .get(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  final map =
                                                      snapshot.data!.data();
                                                  user = UserModel.fromMap(map
                                                      as Map<String, dynamic>);
                                                  return Row(
                                                    children: [
                                                      SizedBox(
                                                        child: user?.profileUrl !=
                                                                    '' &&
                                                                user?.profileUrl !=
                                                                    null
                                                            ? CircleAvatar(
                                                                radius: 13,
                                                                backgroundColor:
                                                                    AppColors
                                                                        .hoverColor,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        user!
                                                                            .profileUrl!),
                                                              )
                                                            : const CircleAvatar(
                                                                radius: 13,
                                                                backgroundColor:
                                                                    AppColors
                                                                        .hoverColor,
                                                                child: Icon(
                                                                  Icons.person,
                                                                  color:
                                                                      AppColors
                                                                          .grey,
                                                                  size: 13,
                                                                ),
                                                              ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        user!.username ?? '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    ],
                                                  );
                                                }
                                                return const SizedBox();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      x10,
                                      SizedBox(
                                        height: 110,
                                        width: 120,
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            books[index].bookImages!.first,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  y10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _mapController.showMarkerInfoWindow(
                                              MarkerId('$index'));
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: const Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.location_pin,
                                                    color: AppColors.secondary),
                                                Text(
                                                  'Locate on map',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.secondary),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (books[index]
                                              .bookMarkedUsers
                                              .contains(FirebaseAuth
                                                  .instance.currentUser!.uid)) {
                                            FirebaseFirestore.instance
                                                .collection('books')
                                                .doc(books[index].bookId)
                                                .update({
                                              'bookMarkedUsers':
                                                  FieldValue.arrayRemove([
                                                FirebaseAuth
                                                    .instance.currentUser!.uid
                                              ])
                                            });
                                            setState(() {
                                              books[index]
                                                  .bookMarkedUsers
                                                  .remove(FirebaseAuth.instance
                                                      .currentUser!.uid);
                                            });
                                          } else {
                                            FirebaseFirestore.instance
                                                .collection('books')
                                                .doc(books[index].bookId)
                                                .update({
                                              'bookMarkedUsers':
                                                  FieldValue.arrayUnion([
                                                FirebaseAuth
                                                    .instance.currentUser!.uid
                                              ])
                                            });
                                            setState(() {
                                              books[index].bookMarkedUsers.add(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid);
                                            });
                                          }
                                        },
                                        child: Icon(
                                          books[index].bookMarkedUsers.contains(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid)
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                          color: isBookMarked
                                              ? AppColors.secondaryGradient
                                              : AppColors.secondaryGradient,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 110,
                                          child: unavailableStatusPills()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
