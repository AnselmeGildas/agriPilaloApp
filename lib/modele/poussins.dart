// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PoussinsUnJour {
  String uid;
  String user_uid;
  String nom;
  String created_at;
  String updated_at;
  int nombre_initial;
  int nombre_bon_etat;
  int nombre_malade;
  int nombre_mort;
  int total_achat;
  PoussinsUnJour({
    required this.uid,
    required this.user_uid,
    required this.nom,
    required this.created_at,
    required this.updated_at,
    required this.nombre_initial,
    required this.nombre_bon_etat,
    required this.nombre_malade,
    required this.nombre_mort,
    required this.total_achat,
  });

  factory PoussinsUnJour.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return PoussinsUnJour(
        uid: document.id,
        total_achat: 10000,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        nombre_initial: (document.data() as Map)['nombre_initial'],
        nombre_bon_etat: (document.data() as Map)['nombre_bon_etat'],
        nombre_malade: (document.data() as Map)['nombre_malade'],
        nombre_mort: (document.data() as Map)['nombre_mort']);
  }

  PoussinsUnJour copyWith({
    String? uid,
    String? user_uid,
    String? nom,
    String? created_at,
    String? updated_at,
    int? nombre_initial,
    int? nombre_bon_etat,
    int? nombre_malade,
    int? nombre_mort,
    int? total_achat,
  }) {
    return PoussinsUnJour(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      nom: nom ?? this.nom,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      nombre_initial: nombre_initial ?? this.nombre_initial,
      nombre_bon_etat: nombre_bon_etat ?? this.nombre_bon_etat,
      nombre_malade: nombre_malade ?? this.nombre_malade,
      nombre_mort: nombre_mort ?? this.nombre_mort,
      total_achat: total_achat ?? this.total_achat,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'nom': nom});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'nombre_initial': nombre_initial});
    result.addAll({'nombre_bon_etat': nombre_bon_etat});
    result.addAll({'nombre_malade': nombre_malade});
    result.addAll({'nombre_mort': nombre_mort});
    result.addAll({'total_achat': total_achat});

    return result;
  }

  factory PoussinsUnJour.fromMap(Map<String, dynamic> map) {
    return PoussinsUnJour(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      nom: map['nom'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      nombre_initial: map['nombre_initial']?.toInt() ?? 0,
      nombre_bon_etat: map['nombre_bon_etat']?.toInt() ?? 0,
      nombre_malade: map['nombre_malade']?.toInt() ?? 0,
      nombre_mort: map['nombre_mort']?.toInt() ?? 0,
      total_achat: map['total_achat']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PoussinsUnJour.fromJson(String source) =>
      PoussinsUnJour.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PoussinsUnJour(uid: $uid, user_uid: $user_uid, nom: $nom, created_at: $created_at, updated_at: $updated_at, nombre_initial: $nombre_initial, nombre_bon_etat: $nombre_bon_etat, nombre_malade: $nombre_malade, nombre_mort: $nombre_mort, total_achat: $total_achat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PoussinsUnJour &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.nom == nom &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.nombre_initial == nombre_initial &&
        other.nombre_bon_etat == nombre_bon_etat &&
        other.nombre_malade == nombre_malade &&
        other.nombre_mort == nombre_mort &&
        other.total_achat == total_achat;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        nom.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        nombre_initial.hashCode ^
        nombre_bon_etat.hashCode ^
        nombre_malade.hashCode ^
        nombre_mort.hashCode ^
        total_achat.hashCode;
  }
}
