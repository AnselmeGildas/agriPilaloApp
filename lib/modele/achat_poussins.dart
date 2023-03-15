// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AchatPoussins {
  String uid;
  String user_uid;
  String poussin_uid;
  String cretaed_at;
  String created_at_heure;
  String origine;
  int prix_unitare;
  int nombre;
  int montant;
  AchatPoussins({
    required this.uid,
    required this.user_uid,
    required this.poussin_uid,
    required this.cretaed_at,
    required this.created_at_heure,
    required this.origine,
    required this.prix_unitare,
    required this.nombre,
    required this.montant,
  });

  factory AchatPoussins.FromFirestore(DocumentSnapshot document) {
    Timestamp cretaed = (document.data() as Map)['created_at'];
    return AchatPoussins(
        uid: document.id,
        user_uid: (document.data() as Map<String, dynamic>)['user_uid'],
        poussin_uid: (document.data() as Map<String, dynamic>)['poussin_uid'],
        cretaed_at: DateFormat("dd-MM-yyyy").format(cretaed.toDate()),
        created_at_heure: DateFormat("HH:mm:ss").format(cretaed.toDate()),
        origine: (document.data() as Map<String, dynamic>)['origine'],
        prix_unitare: (document.data() as Map)['prix_unitaire'],
        nombre: (document.data() as Map)['nombre'],
        montant: (document.data() as Map)['montant']);
  }

  AchatPoussins copyWith({
    String? uid,
    String? user_uid,
    String? poussin_uid,
    String? cretaed_at,
    String? created_at_heure,
    String? origine,
    int? prix_unitare,
    int? nombre,
    int? montant,
  }) {
    return AchatPoussins(
      uid: uid ?? this.uid,
      user_uid: user_uid ?? this.user_uid,
      poussin_uid: poussin_uid ?? this.poussin_uid,
      cretaed_at: cretaed_at ?? this.cretaed_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      origine: origine ?? this.origine,
      prix_unitare: prix_unitare ?? this.prix_unitare,
      nombre: nombre ?? this.nombre,
      montant: montant ?? this.montant,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'user_uid': user_uid});
    result.addAll({'poussin_uid': poussin_uid});
    result.addAll({'cretaed_at': cretaed_at});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'origine': origine});
    result.addAll({'prix_unitare': prix_unitare});
    result.addAll({'nombre': nombre});
    result.addAll({'montant': montant});

    return result;
  }

  factory AchatPoussins.fromMap(Map<String, dynamic> map) {
    return AchatPoussins(
      uid: map['uid'] ?? '',
      user_uid: map['user_uid'] ?? '',
      poussin_uid: map['poussin_uid'] ?? '',
      cretaed_at: map['cretaed_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      origine: map['origine'] ?? '',
      prix_unitare: map['prix_unitare']?.toInt() ?? 0,
      nombre: map['nombre']?.toInt() ?? 0,
      montant: map['montant']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AchatPoussins.fromJson(String source) =>
      AchatPoussins.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AchatPoussins(uid: $uid, user_uid: $user_uid, poussin_uid: $poussin_uid, cretaed_at: $cretaed_at, created_at_heure: $created_at_heure, origine: $origine, prix_unitare: $prix_unitare, nombre: $nombre, montant: $montant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AchatPoussins &&
        other.uid == uid &&
        other.user_uid == user_uid &&
        other.poussin_uid == poussin_uid &&
        other.cretaed_at == cretaed_at &&
        other.created_at_heure == created_at_heure &&
        other.origine == origine &&
        other.prix_unitare == prix_unitare &&
        other.nombre == nombre &&
        other.montant == montant;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        user_uid.hashCode ^
        poussin_uid.hashCode ^
        cretaed_at.hashCode ^
        created_at_heure.hashCode ^
        origine.hashCode ^
        prix_unitare.hashCode ^
        nombre.hashCode ^
        montant.hashCode;
  }
}
