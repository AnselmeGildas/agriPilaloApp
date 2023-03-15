// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Fientes {
  String uid;
  String user_uid;
  String nom;
  String type_sack;
  String created_at;
  int prix_unitaire;
  int nombre_initial;
  int nombre_restant;
  int montant_vendu;
  Fientes({
    required this.uid,
    required this.user_uid,
    required this.nom,
    required this.type_sack,
    required this.created_at,
    required this.prix_unitaire,
    required this.nombre_initial,
    required this.nombre_restant,
    required this.montant_vendu,
  });

  factory Fientes.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    return Fientes(
        uid: document.id,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        type_sack: (document.data() as Map<String, dynamic>)['type_sack'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        prix_unitaire: (document.data() as Map)['prix_unitaire'],
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_restant: (document.data() as Map)['nombre_restant'],
        montant_vendu: (document.data() as Map)['montant_vendu']);
  }

  Fientes copyWith({
    String? uid,
    String? user_uid,
    String? nom,
    String? type_sack,
    String? created_at,
    int? prix_unitaire,
    int? nombre_initial,
    int? nombre_restant,
    int? montant_vendu,
  }) {
    return Fientes(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      nom: nom ?? this.nom,
      type_sack: type_sack ?? this.type_sack,
      created_at: created_at ?? this.created_at,
      prix_unitaire: prix_unitaire ?? this.prix_unitaire,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_restant: nombre_restant ?? this.nombre_restant,
      montant_vendu: montant_vendu ?? this.montant_vendu,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'nom': nom});
    result.addAll({'type_sack': type_sack});
    result.addAll({'created_at': created_at});
    result.addAll({'prix_unitaire': prix_unitaire});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_restant': nombre_restant});
    result.addAll({'montant_vendu': montant_vendu});

    return result;
  }

  factory Fientes.fromMap(Map<String, dynamic> map) {
    return Fientes(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      nom: map['nom'] ?? '',
      type_sack: map['type_sack'] ?? '',
      created_at: map['created_at'] ?? '',
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_restant: map['nombre_restant']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fientes.fromJson(String source) =>
      Fientes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fientes(uid: $uid, user_uid: $user_uid, nom: $nom, type_sack: $type_sack, created_at: $created_at, prix_unitaire: $prix_unitaire, nombre_initial: $nombre_initial, nombre_restant: $nombre_restant, montant_vendu: $montant_vendu)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Fientes &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.nom == nom &&
        other.type_sack == type_sack &&
        other.created_at == created_at &&
        other.prix_unitaire == prix_unitaire &&
        other.nombre_initial == nombre_initial &&
        other.nombre_restant == nombre_restant &&
        other.montant_vendu == montant_vendu;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        nom.hashCode ^
        type_sack.hashCode ^
        created_at.hashCode ^
        prix_unitaire.hashCode ^
        nombre_initial.hashCode ^
        nombre_restant.hashCode ^
        montant_vendu.hashCode;
  }
}
