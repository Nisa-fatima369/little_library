// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Chat {
  final String chatId;
  final String lastMessage;
  DateTime? lastMessageTime;
  final String? receiver;
  final String sender;
  final List<String> users;
  final List<String> messages;
  
  Chat({
    required this.chatId,
    required this.lastMessage,
    this.lastMessageTime,
    this.receiver,
    required this.sender,
    required this.users,
    required this.messages,
  });

  Chat copyWith({
    String? chatId,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? receiver,
    String? sender,
    List<String>? users,
    List<String>? messages,
  }) {
    return Chat(
      chatId: chatId ?? this.chatId,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      receiver: receiver ?? this.receiver,
      sender: sender ?? this.sender,
      users: users ?? this.users,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatId': chatId,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime?.millisecondsSinceEpoch,
      'receiver': receiver,
      'sender': sender,
      'users': users,
      'messages': messages,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      chatId: map['chatId'] as String,
      lastMessage: map['lastMessage'] as String,
      lastMessageTime: map['lastMessageTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastMessageTime'] as int)
          : null,
      receiver: map['receiver'] != null ? map['receiver'] as String : null,
      sender: map['sender'] as String,
      users: List<String>.from(
        (map['users'] as List<String>),
      ),
      messages: List<String>.from(
        (map['messages'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chat(chatId: $chatId, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, receiver: $receiver, sender: $sender, users: $users, messages: $messages)';
  }

  @override
  bool operator ==(covariant Chat other) {
    if (identical(this, other)) return true;

    return other.chatId == chatId &&
        other.lastMessage == lastMessage &&
        other.lastMessageTime == lastMessageTime &&
        other.receiver == receiver &&
        other.sender == sender &&
        listEquals(other.users, users) &&
        listEquals(other.messages, messages);
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
        lastMessage.hashCode ^
        lastMessageTime.hashCode ^
        receiver.hashCode ^
        sender.hashCode ^
        users.hashCode ^
        messages.hashCode;
  }
}
