// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Services {
  String uid;
  String user_uid;
  String nom;
  String description;
  String titre;
  String created_at;
  String cretad_at_heure;
  String photo;
  String updated_at;
  Services({
    required this.uid,
    required this.user_uid,
    required this.nom,
    required this.description,
    required this.titre,
    required this.created_at,
    required this.cretad_at_heure,
    required this.photo,
    required this.updated_at,
  });

  factory Services.FromFirestore(DocumentSnapshot document) {
    Timestamp createsd = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Services(
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        photo: (document.data() as Map<String, dynamic>)['photo_url'],
        uid: document.id,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        description: (document.data() as Map<String, dynamic>)['description'],
        titre: (document.data() as Map<String, dynamic>)['titre'],
        created_at: DateFormat("dd-MM-yyyy").format(createsd.toDate()),
        cretad_at_heure: DateFormat("HH:mm:ss").format(createsd.toDate()));
  }

  Services copyWith({
    String? uid,
    String? user_uid,
    String? nom,
    String? description,
    String? titre,
    String? created_at,
    String? cretad_at_heure,
    String? photo,
    String? updated_at,
  }) {
    return Services(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      titre: titre ?? this.titre,
      created_at: created_at ?? this.created_at,
      cretad_at_heure: cretad_at_heure ?? this.cretad_at_heure,
      photo: photo ?? this.photo,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'nom': nom});
    result.addAll({'description': description});
    result.addAll({'titre': titre});
    result.addAll({'created_at': created_at});
    result.addAll({'cretad_at_heure': cretad_at_heure});
    result.addAll({'photo': photo});
    result.addAll({'updated_at': updated_at});

    return result;
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      nom: map['nom'] ?? '',
      description: map['description'] ?? '',
      titre: map['titre'] ?? '',
      created_at: map['created_at'] ?? '',
      cretad_at_heure: map['cretad_at_heure'] ?? '',
      photo: map['photo'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Services.fromJson(String source) =>
      Services.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Services(uid: $uid, user_uid: $user_uid, nom: $nom, description: $description, titre: $titre, created_at: $created_at, cretad_at_heure: $cretad_at_heure, photo: $photo, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Services &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.nom == nom &&
        other.description == description &&
        other.titre == titre &&
        other.created_at == created_at &&
        other.cretad_at_heure == cretad_at_heure &&
        other.photo == photo &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        titre.hashCode ^
        created_at.hashCode ^
        cretad_at_heure.hashCode ^
        photo.hashCode ^
        updated_at.hashCode;
  }
}
