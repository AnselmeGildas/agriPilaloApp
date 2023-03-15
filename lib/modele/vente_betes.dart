// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class VenteBetes {
  final String uid;
  final String user_uid;
  final String bete_uid;
  final String created_at;
  final int montant;
  final int nombre;
  final String annee;
  final int created_at_in_days;
  final String created_at_heure;
  final String updated_at;
  final String updated_at_heure;
  final bool updated;
  final String bete_nom;
  VenteBetes({
    required this.uid,
    required this.user_uid,
    required this.bete_uid,
    required this.created_at,
    required this.montant,
    required this.nombre,
    required this.annee,
    required this.created_at_in_days,
    required this.created_at_heure,
    required this.updated_at,
    required this.updated_at_heure,
    required this.updated,
    required this.bete_nom,
  });

  factory VenteBetes.FromFirestore(DocumentSnapshot document) {
    Timestamp updated = (document.data() as Map)['updated_at'];
    Timestamp created = (document.data() as Map)['created_at'];
    return VenteBetes(
        bete_nom: (document.data() as Map<String, dynamic>)['bete_nom'],
        updated_at_heure: DateFormat("HH:mm:ss").format(updated.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        updated: (document.data() as Map)['updated'],
        created_at_heure: DateFormat("HH:mm;ss").format(created.toDate()),
        created_at_in_days: created.millisecondsSinceEpoch,
        annee: DateFormat("yyyy").format(created.toDate()),
        nombre: (document.data() as Map)['nombre'],
        uid: document.id,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        bete_uid: (document.data() as Map<String, dynamic>)['bete_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        montant: (document.data() as Map)['montant']);
  }

  VenteBetes copyWith({
    String? uid,
    String? user_uid,
    String? bete_uid,
    String? created_at,
    int? montant,
    int? nombre,
    String? annee,
    int? created_at_in_days,
    String? created_at_heure,
    String? updated_at,
    String? updated_at_heure,
    bool? updated,
    String? bete_nom,
  }) {
    return VenteBetes(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      bete_uid: bete_uid ?? this.bete_uid,
      created_at: created_at ?? this.created_at,
      montant: montant ?? this.montant,
      nombre: nombre ?? this.nombre,
      annee: annee ?? this.annee,
      created_at_in_days: created_at_in_days ?? this.created_at_in_days,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      updated_at: updated_at ?? this.updated_at,
      updated_at_heure: updated_at_heure ?? this.updated_at_heure,
      updated: updated ?? this.updated,
      bete_nom: bete_nom ?? this.bete_nom,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'bete_uid': bete_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'montant': montant});
    result.addAll({'nombre': nombre});
    result.addAll({'annee': annee});
    result.addAll({'created_at_in_days': created_at_in_days});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'updated_at': updated_at});
    result.addAll({'updated_at_heure': updated_at_heure});
    result.addAll({'updated': updated});
    result.addAll({'bete_nom': bete_nom});

    return result;
  }

  factory VenteBetes.fromMap(Map<String, dynamic> map) {
    return VenteBetes(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      bete_uid: map['bete_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      nombre: map['nombre']?.toInt() ?? 0,
      annee: map['annee'] ?? '',
      created_at_in_days: map['created_at_in_days']?.toInt() ?? 0,
      created_at_heure: map['created_at_heure'] ?? '',
      updated_at: map['updated_at'] ?? '',
      updated_at_heure: map['updated_at_heure'] ?? '',
      updated: map['updated'] ?? false,
      bete_nom: map['bete_nom'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VenteBetes.fromJson(String source) =>
      VenteBetes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VenteBetes(uid: $uid, user_uid: $user_uid, bete_uid: $bete_uid, created_at: $created_at, montant: $montant, nombre: $nombre, annee: $annee, created_at_in_days: $created_at_in_days, created_at_heure: $created_at_heure, updated_at: $updated_at, updated_at_heure: $updated_at_heure, updated: $updated, bete_nom: $bete_nom)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VenteBetes &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.bete_uid == bete_uid &&
        other.created_at == created_at &&
        other.montant == montant &&
        other.nombre == nombre &&
        other.annee == annee &&
        other.created_at_in_days == created_at_in_days &&
        other.created_at_heure == created_at_heure &&
        other.updated_at == updated_at &&
        other.updated_at_heure == updated_at_heure &&
        other.updated == updated &&
        other.bete_nom == bete_nom;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        bete_uid.hashCode ^
        created_at.hashCode ^
        montant.hashCode ^
        nombre.hashCode ^
        annee.hashCode ^
        created_at_in_days.hashCode ^
        created_at_heure.hashCode ^
        updated_at.hashCode ^
        updated_at_heure.hashCode ^
        updated.hashCode ^
        bete_nom.hashCode;
  }
}
