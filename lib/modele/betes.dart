// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Betes {
  String uid;
  String nom;
  String user_uid;
  String created_at;
  int nombre_initial;
  int nombre_restant;
  int montant_vendu;
  int nombre_malade;
  int nombre_mort;
  String updated_at;
  int prix_unitaire;
  Betes({
    required this.uid,
    required this.nom,
    required this.user_uid,
    required this.created_at,
    required this.nombre_initial,
    required this.nombre_restant,
    required this.montant_vendu,
    required this.nombre_malade,
    required this.nombre_mort,
    required this.updated_at,
    required this.prix_unitaire,
  });

  factory Betes.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return Betes(
        prix_unitaire: (document.data() as Map)['prix_unitaire'],
        uid: document.id,
        nom: (document.data() as Map<String, dynamic>)['nom'],
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_restant: (document.data() as Map)['nombre_restant'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        nombre_malade: (document.data() as Map)['nombre_malade'],
        nombre_mort: (document.data() as Map)['nombre_mort'],
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()));
  }

  Betes copyWith({
    String? uid,
    String? nom,
    String? user_uid,
    String? created_at,
    int? nombre_initial,
    int? nombre_restant,
    int? montant_vendu,
    int? nombre_malade,
    int? nombre_mort,
    String? updated_at,
    int? prix_unitaire,
  }) {
    return Betes(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_restant: nombre_restant ?? this.nombre_restant,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      nombre_malade: nombre_malade ?? this.nombre_malade,
      nombre_mort: nombre_mort ?? this.nombre_mort,
      updated_at: updated_at ?? this.updated_at,
      prix_unitaire: prix_unitaire ?? this.prix_unitaire,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom': nom});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_restant': nombre_restant});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'nombre_malade': nombre_malade});
    result.addAll({'nombre_mort': nombre_mort});
    result.addAll({'updated_at': updated_at});
    result.addAll({'prix_unitaire': prix_unitaire});

    return result;
  }

  factory Betes.fromMap(Map<String, dynamic> map) {
    return Betes(
      uid: map['uid'] ?? '',
      nom: map['nom'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_restant: map['nombre_restant']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      nombre_malade: map['nombre_malade']?.toInt() ?? 0,
      nombre_mort: map['nombre_mort']?.toInt() ?? 0,
      updated_at: map['updated_at'] ?? '',
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Betes.fromJson(String source) => Betes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Betes(uid: $uid, nom: $nom, user_uid: $user_uid, created_at: $created_at, nombre_initial: $nombre_initial, nombre_restant: $nombre_restant, montant_vendu: $montant_vendu, nombre_malade: $nombre_malade, nombre_mort: $nombre_mort, updated_at: $updated_at, prix_unitaire: $prix_unitaire)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Betes &&
        other.uid == uid &&
        other.nom == nom &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.nombre_initial == nombre_initial &&
        other.nombre_restant == nombre_restant &&
        other.montant_vendu == montant_vendu &&
        other.nombre_malade == nombre_malade &&
        other.nombre_mort == nombre_mort &&
        other.updated_at == updated_at &&
        other.prix_unitaire == prix_unitaire;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        nombre_initial.hashCode ^
        nombre_restant.hashCode ^
        montant_vendu.hashCode ^
        nombre_malade.hashCode ^
        nombre_mort.hashCode ^
        updated_at.hashCode ^
        prix_unitaire.hashCode;
  }
}
