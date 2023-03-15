// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Problemes {
  final String uid;
  final String description;
  final String created_at;
  final String created_at_heure;
  final String user_uid;
  Problemes({
    required this.uid,
    required this.description,
    required this.created_at,
    required this.created_at_heure,
    required this.user_uid,
  });

  factory Problemes.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    return Problemes(
        uid: document.id,
        description: (document.data() as Map<String, dynamic>)['description'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        created_at_heure: DateFormat("HH:mm:ss").format(created.toDate()),
        user_uid: (document.data() as Map<String, dynamic>)['user_uid']);
  }

  Problemes copyWith({
    String? uid,
    String? description,
    String? created_at,
    String? created_at_heure,
    String? user_uid,
  }) {
    return Problemes(
      uid: uid ?? this.uid,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      user_uid: user_uid ?? this.user_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory Problemes.fromMap(Map<String, dynamic> map) {
    return Problemes(
      uid: map['uid'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Problemes.fromJson(String source) =>
      Problemes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Problemes(uid: $uid, description: $description, created_at: $created_at, created_at_heure: $created_at_heure, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Problemes &&
        other.uid == uid &&
        other.description == description &&
        other.created_at == created_at &&
        other.created_at_heure == created_at_heure &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        created_at_heure.hashCode ^
        user_uid.hashCode;
  }
}
