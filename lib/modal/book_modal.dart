// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String bookId;
  String? bookName;
  String? bookAuthor;
  String? bookDescription;
  DateTime? dateTime;
  String? addressLine;
  Map<String, dynamic>? bookOwnerAddress;
  String? fullAddress;
  String? bookOwnerName;
  String? bookOwnerId;
  String? bookOwnerEmail;
  String? city;
  String? postal;
  String? state;
  String? bookCategory;
  bool? bookAvailable;
  List<String>? bookImages;
  List<String> bookMarkedUsers = [];
  GeoPoint? locationCoordinates;

  Book({
    required this.bookId,
    this.bookName,
    this.bookAuthor,
    this.bookDescription,
    this.dateTime,
    this.addressLine,
    this.bookOwnerAddress,
    this.fullAddress,
    this.bookOwnerName,
    this.bookOwnerId,
    this.bookOwnerEmail,
    this.city,
    this.postal,
    this.state,
    this.bookCategory,
    this.bookAvailable,
    this.bookImages,
    this.bookMarkedUsers = const [],
    this.locationCoordinates,
  });

  Book copyWith({
    String? bookId,
    String? bookName,
    String? bookAuthor,
    String? bookDescription,
    DateTime? dateTime,
    String? addressLine,
    Map<String, dynamic>? bookOwnerAddress,
    String? fullAddress,
    String? bookOwnerName,
    String? bookOwnerId,
    String? bookOwnerEmail,
    String? city,
    String? postal,
    String? state,
    String? bookCategory,
    bool? bookAvailable,
    List<String>? bookImages,
    List<String>? bookMarkedUsers,
    GeoPoint? locationCoordinates,

  }) {
    return Book(
      bookId: bookId ?? this.bookId,
      bookName: bookName ?? this.bookName,
      bookAuthor: bookAuthor ?? this.bookAuthor,
      bookDescription: bookDescription ?? this.bookDescription,
      dateTime: dateTime ?? this.dateTime,
      addressLine: addressLine ?? this.addressLine,
      bookOwnerAddress: bookOwnerAddress ?? this.bookOwnerAddress,
      fullAddress: fullAddress ?? this.fullAddress,
      bookOwnerName: bookOwnerName ?? this.bookOwnerName,
      bookOwnerId: bookOwnerId ?? this.bookOwnerId,
      bookOwnerEmail: bookOwnerEmail ?? this.bookOwnerEmail,
      city: city ?? this.city,
      postal: postal ?? this.postal,
      state: state ?? this.state,
      bookCategory: bookCategory ?? this.bookCategory,
      bookAvailable: bookAvailable ?? this.bookAvailable,
      bookImages: bookImages ?? this.bookImages,
      bookMarkedUsers: bookMarkedUsers ?? this.bookMarkedUsers,
      locationCoordinates: locationCoordinates ?? this.locationCoordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'bookName': bookName,
      'bookAuthor': bookAuthor,
      'bookDescription': bookDescription,
      'dateTime': dateTime,
      'addressLine': addressLine,
      'bookOwnerAddress': bookOwnerAddress,
      'fullAddress': fullAddress,
      'bookOwnerName': bookOwnerName,
      'bookOwnerId': bookOwnerId,
      'bookOwnerEmail': bookOwnerEmail,
      'city': city,
      'postal': postal,
      'state': state,
      'bookCategory': bookCategory,
      'bookAvailable': bookAvailable,
      'bookImages': bookImages,
      'bookMarkedUsers': bookMarkedUsers,
      'latitude': locationCoordinates?.latitude,
      'longitude': locationCoordinates?.longitude,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      bookId: map['bookId'],
      bookName: map['bookName'],
      bookAuthor: map['bookAuthor'],
      bookDescription: map['bookDescription'],
      dateTime: map['dateTime']?.toDate(),
      addressLine: map['addressLine'],
      bookOwnerAddress: map['bookOwnerAddress'],
      fullAddress: map['fullAddress'],
      bookOwnerName: map['bookOwnerName'],
      bookOwnerId: map['bookOwnerId'],
      bookOwnerEmail: map['bookOwnerEmail'],
      city: map['city'],
      postal: map['postal'],
      state: map['state'],
      bookCategory: map['bookCategory'],
      bookAvailable: map['bookAvailable'],
      bookImages: List<String>.from(map['bookImages']),
      bookMarkedUsers: List<String>.from(map['bookMarkedUsers']),
      locationCoordinates: GeoPoint(map['latitude'], map['longitude']),
      
    );
  }

  static fromJson(data) {}
}
