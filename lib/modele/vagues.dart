// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Vagues {
  final String uid;
  final String nom;
  final bool cloture;
  final String user_uid;
  final String description;
  final String created_at;
  final String created_at_heure;
  final String updated_att;
  final String updated_at_heure;
  Vagues({
    required this.uid,
    required this.nom,
    required this.cloture,
    required this.user_uid,
    required this.description,
    required this.created_at,
    required this.created_at_heure,
    required this.updated_att,
    required this.updated_at_heure,
  });

  factory Vagues.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Vagues(
        cloture: (document.data() as Map)["cloture"],
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        uid: document.id,
        nom: (document.data() as Map<String, dynamic>)['nom'],
        description: (document.data() as Map<String, dynamic>)['description'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        created_at_heure: DateFormat("HH:mm:ss").format(created.toDate()),
        updated_att: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        updated_at_heure: DateFormat("HH:mm:ss").format(updated.toDate()));
  }

  Vagues copyWith({
    String? uid,
    String? nom,
    bool? cloture,
    String? user_uid,
    String? description,
    String? created_at,
    String? created_at_heure,
    String? updated_att,
    String? updated_at_heure,
  }) {
    return Vagues(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      cloture: cloture ?? this.cloture,
      user_uid: user_uid ?? this.user_uid,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      updated_att: updated_att ?? this.updated_att,
      updated_at_heure: updated_at_heure ?? this.updated_at_heure,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'cloture': cloture});
    result.addAll({'user_uid': user_uid});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'updated_att': updated_att});
    result.addAll({'updated_at_heure': updated_at_heure});

    return result;
  }

  factory Vagues.fromMap(Map<String, dynamic> map) {
    return Vagues(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      cloture: map['cloture'] ?? false,
      user_uid: map['user_uid'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      updated_att: map['updated_att'] ?? '',
      updated_at_heure: map['updated_at_heure'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vagues.fromJson(String source) => Vagues.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vagues(uid: $uid, nom: $nom, cloture: $cloture, user_uid: $user_uid, description: $description, created_at: $created_at, created_at_heure: $created_at_heure, updated_att: $updated_att, updated_at_heure: $updated_at_heure)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vagues &&
        other.uid == uid &&
        other.nom == nom &&
        other.cloture == cloture &&
        other.user_uid == user_uid &&
        other.description == description &&
        other.created_at == created_at &&
        other.created_at_heure == created_at_heure &&
        other.updated_att == updated_att &&
        other.updated_at_heure == updated_at_heure;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        cloture.hashCode ^
        user_uid.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        created_at_heure.hashCode ^
        updated_att.hashCode ^
        updated_at_heure.hashCode;
  }
}
