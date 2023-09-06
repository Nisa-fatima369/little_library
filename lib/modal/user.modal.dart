// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String username;
  final String email;
  final String password;
  final String? profileUrl;
  final String userID;
  
  UserModel({
    required this.username,
    required this.email,
    required this.password,
    this.profileUrl,
    required this.userID,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? password,
    String? profileUrl,
    String? userID,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      profileUrl: profileUrl ?? this.profileUrl,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'profileUrl': profileUrl,
      'userID': userID,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      profileUrl:
          map['profileUrl'] != null ? map['profileUrl'] as String : null,
      userID: map['userID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, password: $password, profileUrl: $profileUrl, userID: $userID)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password &&
        other.profileUrl == profileUrl &&
        other.userID == userID;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        profileUrl.hashCode ^
        userID.hashCode;
  }
}
