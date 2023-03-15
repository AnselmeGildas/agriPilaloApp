// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Appreciations {
  String uid;
  String created_at;
  String created_at_heure;
  String appreciation;
  String nom;
  String suggestion;
  String email;
  Appreciations({
    required this.uid,
    required this.created_at,
    required this.created_at_heure,
    required this.appreciation,
    required this.nom,
    required this.suggestion,
    required this.email,
  });

  factory Appreciations.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    return Appreciations(
        uid: document.id,
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        created_at_heure: DateFormat("HH:mm:ss").format(created.toDate()),
        appreciation: (document.data() as Map<String, dynamic>)['appreciation'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        suggestion: (document.data() as Map<String, dynamic>)['suggestion'],
        email: (document.data() as Map<String, dynamic>)['email']);
  }

  Appreciations copyWith({
    String? uid,
    String? created_at,
    String? created_at_heure,
    String? appreciation,
    String? nom,
    String? suggestion,
    String? email,
  }) {
    return Appreciations(
      uid: uid ?? this.uid,
      created_at: created_at ?? this.created_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      appreciation: appreciation ?? this.appreciation,
      nom: nom ?? this.nom,
      suggestion: suggestion ?? this.suggestion,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'created_at': created_at});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'appreciation': appreciation});
    result.addAll({'nom': nom});
    result.addAll({'suggestion': suggestion});
    result.addAll({'email': email});

    return result;
  }

  factory Appreciations.fromMap(Map<String, dynamic> map) {
    return Appreciations(
      uid: map['uid'] ?? '',
      created_at: map['created_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      appreciation: map['appreciation'] ?? '',
      nom: map['nom'] ?? '',
      suggestion: map['suggestion'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Appreciations.fromJson(String source) =>
      Appreciations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appreciations(uid: $uid, created_at: $created_at, created_at_heure: $created_at_heure, appreciation: $appreciation, nom: $nom, suggestion: $suggestion, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Appreciations &&
        other.uid == uid &&
        other.created_at == created_at &&
        other.created_at_heure == created_at_heure &&
        other.appreciation == appreciation &&
        other.nom == nom &&
        other.suggestion == suggestion &&
        other.email == email;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        created_at.hashCode ^
        created_at_heure.hashCode ^
        appreciation.hashCode ^
        nom.hashCode ^
        suggestion.hashCode ^
        email.hashCode;
  }
}
