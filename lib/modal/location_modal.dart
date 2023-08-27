import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  String title;
  String description;
  String? profileUrl;
  String username;
  String imageUrl;
  String bookStatus;
  String bookMarked;
  LatLng locationCoords;

  LocationData({
    required this.title,
    required this.description,
    this.profileUrl,
    required this.username,
    required this.imageUrl,
    required this.bookStatus,
    required this.bookMarked,
    required this.locationCoords,
  });
}

final List<LocationData> locationData = [
  LocationData(
    title: 'Object Oriented Programming',
    description: 'This books guves us the description of computer programming',
    username: 'Noor-ul-Ain',
    imageUrl: '',
    bookStatus: 'Unavailable',
    bookMarked: '',
    locationCoords: LatLng(31.41712724021393, 73.0665898754636),
  ),
  LocationData(
    title: 'Computer Basics',
    description: 'This books guves us the description of computer basics',
    username: 'Nisa Fatima',
    imageUrl: '',
    bookStatus: 'Available',
    bookMarked: '',
    locationCoords: LatLng(31.413256879449808, 73.04990047462901),
  ),
  LocationData(
    title: 'Graphics',
    description: 'Graphical Representation of coords',
    username: 'Amna khalil',
    imageUrl: '',
    bookStatus: 'Available',
    bookMarked: '',
    locationCoords: LatLng(31.42361884263019, 73.0346926488881),
  ),
  LocationData(
    title: 'KIET',
    description: 'Kiet University',
    username: 'Hamza',
    imageUrl: '',
    bookStatus: 'Available',
    bookMarked: '',
    locationCoords: LatLng(31.419880964588813, 73.14462525098992),
  ),
  LocationData(
    title: 'Basics',
    description: '',
    username: 'Nisa ',
    imageUrl: '',
    bookStatus: 'Unavailable',
    bookMarked: '',
    locationCoords: LatLng(31.442793125140657, 72.93661356124632),
  ),
  LocationData(
    title: 'Computer Basics',
    description: 'This books guves us the description of computer basics',
    username: 'Fatima',
    imageUrl: '',
    bookStatus: 'Available',
    bookMarked: '',
    locationCoords: LatLng(31.377847868588432, 73.08611967013417),
  ),
  LocationData(
    title: 'Tkinter',
    description: 'This books guves us the description of computer',
    username: 'Ahmed',
    imageUrl: '',
    bookStatus: 'Unavailable',
    bookMarked: '',
    locationCoords: LatLng(31.35164950406796, 73.07740245048011),
  ),
];
