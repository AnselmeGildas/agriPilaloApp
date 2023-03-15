// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class VenteOeufTables {
  final String uid;
  final String oeuf_uid;
  final String user_uid;
  final int montant;
  final int nombre;
  final String created_at;
  final String annee;
  final int created_at_in_days;
  final String cretaed_at_heure;
  final String updated_at;
  final String updated_at_heure;
  final bool updated;
  final bool unite;
  VenteOeufTables({
    required this.uid,
    required this.oeuf_uid,
    required this.user_uid,
    required this.montant,
    required this.nombre,
    required this.created_at,
    required this.annee,
    required this.created_at_in_days,
    required this.cretaed_at_heure,
    required this.updated_at,
    required this.updated_at_heure,
    required this.updated,
    required this.unite,
  });

  factory VenteOeufTables.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return VenteOeufTables(
        unite: (document.data() as Map)['unite'],
        updated_at_heure: DateFormat("HH:mm:ss").format(updated.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        updated: (document.data() as Map)['updated'],
        cretaed_at_heure: DateFormat("HH:mm:ss").format(created.toDate()),
        created_at_in_days: created.millisecondsSinceEpoch,
        annee: DateFormat("yyyy").format(created.toDate()),
        uid: document.id,
        oeuf_uid: (document.data() as Map<String, dynamic>)['oeuf_uid'],
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        montant: (document.data() as Map)['montant'],
        nombre: (document.data() as Map)['nombre'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()));
  }

  VenteOeufTables copyWith({
    String? uid,
    String? oeuf_uid,
    String? user_uid,
    int? montant,
    int? nombre,
    String? created_at,
    String? annee,
    int? created_at_in_days,
    String? cretaed_at_heure,
    String? updated_at,
    String? updated_at_heure,
    bool? updated,
    bool? unite,
  }) {
    return VenteOeufTables(
      uid: uid ?? this.uid,
      oeuf_uid: oeuf_uid ?? this.oeuf_uid,
      user_uid: user_uid ?? this.user_uid,
      montant: montant ?? this.montant,
      nombre: nombre ?? this.nombre,
      created_at: created_at ?? this.created_at,
      annee: annee ?? this.annee,
      created_at_in_days: created_at_in_days ?? this.created_at_in_days,
      cretaed_at_heure: cretaed_at_heure ?? this.cretaed_at_heure,
      updated_at: updated_at ?? this.updated_at,
      updated_at_heure: updated_at_heure ?? this.updated_at_heure,
      updated: updated ?? this.updated,
      unite: unite ?? this.unite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'oeuf_uid': oeuf_uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'montant': montant});
    result.addAll({'nombre': nombre});
    result.addAll({'created_at': created_at});
    result.addAll({'annee': annee});
    result.addAll({'created_at_in_days': created_at_in_days});
    result.addAll({'cretaed_at_heure': cretaed_at_heure});
    result.addAll({'updated_at': updated_at});
    result.addAll({'updated_at_heure': updated_at_heure});
    result.addAll({'updated': updated});
    result.addAll({'unite': unite});

    return result;
  }

  factory VenteOeufTables.fromMap(Map<String, dynamic> map) {
    return VenteOeufTables(
      uid: map['uid'] ?? '',
      oeuf_uid: map['oeuf_uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      nombre: map['nombre']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      annee: map['annee'] ?? '',
      created_at_in_days: map['created_at_in_days']?.toInt() ?? 0,
      cretaed_at_heure: map['cretaed_at_heure'] ?? '',
      updated_at: map['updated_at'] ?? '',
      updated_at_heure: map['updated_at_heure'] ?? '',
      updated: map['updated'] ?? false,
      unite: map['unite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VenteOeufTables.fromJson(String source) =>
      VenteOeufTables.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VenteOeufTables(uid: $uid, oeuf_uid: $oeuf_uid, user_uid: $user_uid, montant: $montant, nombre: $nombre, created_at: $created_at, annee: $annee, created_at_in_days: $created_at_in_days, cretaed_at_heure: $cretaed_at_heure, updated_at: $updated_at, updated_at_heure: $updated_at_heure, updated: $updated, unite: $unite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VenteOeufTables &&
        other.uid == uid &&
        other.oeuf_uid == oeuf_uid &&
        other.user_uid == user_uid &&
        other.montant == montant &&
        other.nombre == nombre &&
        other.created_at == created_at &&
        other.annee == annee &&
        other.created_at_in_days == created_at_in_days &&
        other.cretaed_at_heure == cretaed_at_heure &&
        other.updated_at == updated_at &&
        other.updated_at_heure == updated_at_heure &&
        other.updated == updated &&
        other.unite == unite;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        oeuf_uid.hashCode ^
        user_uid.hashCode ^
        montant.hashCode ^
        nombre.hashCode ^
        created_at.hashCode ^
        annee.hashCode ^
        created_at_in_days.hashCode ^
        cretaed_at_heure.hashCode ^
        updated_at.hashCode ^
        updated_at_heure.hashCode ^
        updated.hashCode ^
        unite.hashCode;
  }
}
