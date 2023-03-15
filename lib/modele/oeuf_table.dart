// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OeufTables {
  String uid;
  String user_uid;
  String nom;
  int nombre_initial;
  int nombre_restant;
  int nombre_casse;
  int prix_unitaire;
  int prix_unitaire_plateaux;
  int montant_vendu;
  String created_at;
  OeufTables({
    required this.uid,
    required this.user_uid,
    required this.nom,
    required this.nombre_initial,
    required this.nombre_restant,
    required this.nombre_casse,
    required this.prix_unitaire,
    required this.prix_unitaire_plateaux,
    required this.montant_vendu,
    required this.created_at,
  });

  factory OeufTables.FromFirestore(DocumentSnapshot document) {
    Timestamp cretaed = (document.data() as Map)['created_at'];
    return OeufTables(
        prix_unitaire_plateaux:
            (document.data() as Map)['prix_unitaire_plateaux'],
        uid: document.id,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_restant: (document.data() as Map)['nombre_restant'],
        nombre_casse: (document.data() as Map)['nombre_casse'],
        prix_unitaire: (document.data() as Map)['prix_unitaire'],
        montant_vendu: (document.data() as Map)['montant_vendu'],
        created_at: DateFormat("dd-MM-yyyy").format(cretaed.toDate()));
  }

  OeufTables copyWith({
    String? uid,
    String? user_uid,
    String? nom,
    int? nombre_initial,
    int? nombre_restant,
    int? nombre_casse,
    int? prix_unitaire,
    int? prix_unitaire_plateaux,
    int? montant_vendu,
    String? created_at,
  }) {
    return OeufTables(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      nom: nom ?? this.nom,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_restant: nombre_restant ?? this.nombre_restant,
      nombre_casse: nombre_casse ?? this.nombre_casse,
      prix_unitaire: prix_unitaire ?? this.prix_unitaire,
      prix_unitaire_plateaux:
          prix_unitaire_plateaux ?? this.prix_unitaire_plateaux,
      montant_vendu: montant_vendu ?? this.montant_vendu,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'nom': nom});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_restant': nombre_restant});
    result.addAll({'nombre_casse': nombre_casse});
    result.addAll({'prix_unitaire': prix_unitaire});
    result.addAll({'prix_unitaire_plateaux': prix_unitaire_plateaux});
    result.addAll({'montant_vendu': montant_vendu});
    result.addAll({'created_at': created_at});

    return result;
  }

  factory OeufTables.fromMap(Map<String, dynamic> map) {
    return OeufTables(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      nom: map['nom'] ?? '',
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_restant: map['nombre_restant']?.toInt() ?? 0,
      nombre_casse: map['nombre_casse']?.toInt() ?? 0,
      prix_unitaire: map['prix_unitaire']?.toInt() ?? 0,
      prix_unitaire_plateaux: map['prix_unitaire_plateaux']?.toInt() ?? 0,
      montant_vendu: map['montant_vendu']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OeufTables.fromJson(String source) =>
      OeufTables.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OeufTables(uid: $uid, user_uid: $user_uid, nom: $nom, nombre_initial: $nombre_initial, nombre_restant: $nombre_restant, nombre_casse: $nombre_casse, prix_unitaire: $prix_unitaire, prix_unitaire_plateaux: $prix_unitaire_plateaux, montant_vendu: $montant_vendu, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OeufTables &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.nom == nom &&
        other.nombre_initial == nombre_initial &&
        other.nombre_restant == nombre_restant &&
        other.nombre_casse == nombre_casse &&
        other.prix_unitaire == prix_unitaire &&
        other.prix_unitaire_plateaux == prix_unitaire_plateaux &&
        other.montant_vendu == montant_vendu &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        nom.hashCode ^
        nombre_initial.hashCode ^
        nombre_restant.hashCode ^
        nombre_casse.hashCode ^
        prix_unitaire.hashCode ^
        prix_unitaire_plateaux.hashCode ^
        montant_vendu.hashCode ^
        created_at.hashCode;
  }
}
