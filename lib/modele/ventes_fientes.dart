// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class VenteFientes {
  final String uid;
  final String fiente_uid;
  final String user_uid;
  final String created_at;
  final int montant;
  final int nombre;
  final String annee;
  final int created_at_in_days;
  final String updated_at;
  final String updated_at_heure;
  final bool updated;
  final String created_at_heure;
  VenteFientes({
    required this.uid,
    required this.fiente_uid,
    required this.user_uid,
    required this.created_at,
    required this.montant,
    required this.nombre,
    required this.annee,
    required this.created_at_in_days,
    required this.updated_at,
    required this.updated_at_heure,
    required this.updated,
    required this.created_at_heure,
  });

  factory VenteFientes.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return VenteFientes(
        created_at_heure: DateFormat("HH:mm:ss").format(created.toDate()),
        updated: (document.data() as Map)['updated'],
        updated_at_heure: DateFormat("HH:mm:ss").format(updated.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        created_at_in_days: created.millisecondsSinceEpoch,
        annee: DateFormat("yyyy").format(created.toDate()),
        uid: document.id,
        fiente_uid: (document.data() as Map<String, dynamic>)['fiente_uid'],
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        montant: (document.data() as Map)['montant'],
        nombre: (document.data() as Map)['nombre']);
  }

  VenteFientes copyWith({
    String? uid,
    String? fiente_uid,
    String? user_uid,
    String? created_at,
    int? montant,
    int? nombre,
    String? annee,
    int? created_at_in_days,
    String? updated_at,
    String? updated_at_heure,
    bool? updated,
    String? created_at_heure,
  }) {
    return VenteFientes(
      uid: uid ?? this.uid,
      fiente_uid: fiente_uid ?? this.fiente_uid,
      user_uid: user_uid ?? this.user_uid,
      created_at: created_at ?? this.created_at,
      montant: montant ?? this.montant,
      nombre: nombre ?? this.nombre,
      annee: annee ?? this.annee,
      created_at_in_days: created_at_in_days ?? this.created_at_in_days,
      updated_at: updated_at ?? this.updated_at,
      updated_at_heure: updated_at_heure ?? this.updated_at_heure,
      updated: updated ?? this.updated,
      created_at_heure: created_at_heure ?? this.created_at_heure,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'fiente_uid': fiente_uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'created_at': created_at});
    result.addAll({'montant': montant});
    result.addAll({'nombre': nombre});
    result.addAll({'annee': annee});
    result.addAll({'created_at_in_days': created_at_in_days});
    result.addAll({'updated_at': updated_at});
    result.addAll({'updated_at_heure': updated_at_heure});
    result.addAll({'updated': updated});
    result.addAll({'created_at_heure': created_at_heure});

    return result;
  }

  factory VenteFientes.fromMap(Map<String, dynamic> map) {
    return VenteFientes(
      uid: map['uid'] ?? '',
      fiente_uid: map['fiente_uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      created_at: map['created_at'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      nombre: map['nombre']?.toInt() ?? 0,
      annee: map['annee'] ?? '',
      created_at_in_days: map['created_at_in_days']?.toInt() ?? 0,
      updated_at: map['updated_at'] ?? '',
      updated_at_heure: map['updated_at_heure'] ?? '',
      updated: map['updated'] ?? false,
      created_at_heure: map['created_at_heure'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VenteFientes.fromJson(String source) =>
      VenteFientes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VenteFientes(uid: $uid, fiente_uid: $fiente_uid, user_uid: $user_uid, created_at: $created_at, montant: $montant, nombre: $nombre, annee: $annee, created_at_in_days: $created_at_in_days, updated_at: $updated_at, updated_at_heure: $updated_at_heure, updated: $updated, created_at_heure: $created_at_heure)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VenteFientes &&
        other.uid == uid &&
        other.fiente_uid == fiente_uid &&
        other.user_uid == user_uid &&
        other.created_at == created_at &&
        other.montant == montant &&
        other.nombre == nombre &&
        other.annee == annee &&
        other.created_at_in_days == created_at_in_days &&
        other.updated_at == updated_at &&
        other.updated_at_heure == updated_at_heure &&
        other.updated == updated &&
        other.created_at_heure == created_at_heure;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        fiente_uid.hashCode ^
        user_uid.hashCode ^
        created_at.hashCode ^
        montant.hashCode ^
        nombre.hashCode ^
        annee.hashCode ^
        created_at_in_days.hashCode ^
        updated_at.hashCode ^
        updated_at_heure.hashCode ^
        updated.hashCode ^
        created_at_heure.hashCode;
  }
}
