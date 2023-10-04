// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String dateTime;
  final String address;
  final String category;
  final String bookStatus;
  final String? imageUrl;
  final String userId;
  final double latitude;
  final double longitude;


  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.dateTime,
    required this.address,
    required this.category,
    required this.bookStatus,
    this.imageUrl,
    required this.userId,
    required this.latitude,
    required this.longitude,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? description,
    String? dateTime,
    String? address,
    String? category,
    String? bookStatus,
    String? imageUrl,
    String? userId,
    double? latitude,
    double? longitude,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      address: address ?? this.address,
      category: category ?? this.category,
      bookStatus: bookStatus ?? this.bookStatus,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'dateTime': dateTime,
      'address': address,
      'category': category,
      'bookStatus': bookStatus,
      'imageUrl': imageUrl,
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      description: map['description'] as String,
      dateTime: map['dateTime'] as String,
      address: map['address'] as String,
      category: map['category'] as String,
      bookStatus: map['bookStatus'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      userId: map['userId'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, description: $description, dateTime: $dateTime, address: $address, category: $category, bookStatus: $bookStatus, imageUrl: $imageUrl, userId: $userId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.author == author &&
      other.description == description &&
      other.dateTime == dateTime &&
      other.address == address &&
      other.category == category &&
      other.bookStatus == bookStatus &&
      other.imageUrl == imageUrl &&
      other.userId == userId &&
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      description.hashCode ^
      dateTime.hashCode ^
      address.hashCode ^
      category.hashCode ^
      bookStatus.hashCode ^
      imageUrl.hashCode ^
      userId.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
  }
}
