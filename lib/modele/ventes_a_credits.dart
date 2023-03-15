// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class VentesACredits {
  final String uid;
  final String nom_client;
  final String achat_effectue;
  final String description;
  final String created_at;
  final String created_at_heure;
  final String updated_at;
  final String updated_at_heure;
  final int montant;
  final bool paye;
  final String user_uid;
  VentesACredits({
    required this.uid,
    required this.nom_client,
    required this.achat_effectue,
    required this.description,
    required this.created_at,
    required this.created_at_heure,
    required this.updated_at,
    required this.updated_at_heure,
    required this.montant,
    required this.paye,
    required this.user_uid,
  });

  factory VentesACredits.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    Timestamp updated = (document.data() as Map)['updated_at'];
    return VentesACredits(
        uid: document.id,
        nom_client: (document.data() as Map<String, dynamic>)['nom'],
        achat_effectue: (document.data() as Map<String, dynamic>)['achat'],
        description: (document.data() as Map<String, dynamic>)['description'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        created_at_heure: DateFormat("HH:mm:ss").format(created.toDate()),
        updated_at: DateFormat("dd-MM-yyyy").format(updated.toDate()),
        updated_at_heure: DateFormat("HH:mm:ss").format(updated.toDate()),
        montant: (document.data() as Map)['montant'],
        paye: (document.data() as Map)['paye'],
        user_uid: (document.data() as Map<String, dynamic>)['user_uid']);
  }

  VentesACredits copyWith({
    String? uid,
    String? nom_client,
    String? achat_effectue,
    String? description,
    String? created_at,
    String? created_at_heure,
    String? updated_at,
    String? updated_at_heure,
    int? montant,
    bool? paye,
    String? user_uid,
  }) {
    return VentesACredits(
      uid: uid ?? this.uid,
      nom_client: nom_client ?? this.nom_client,
      achat_effectue: achat_effectue ?? this.achat_effectue,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      updated_at: updated_at ?? this.updated_at,
      updated_at_heure: updated_at_heure ?? this.updated_at_heure,
      montant: montant ?? this.montant,
      paye: paye ?? this.paye,
      user_uid: user_uid ?? this.user_uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'nom_client': nom_client});
    result.addAll({'achat_effectue': achat_effectue});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'updated_at': updated_at});
    result.addAll({'updated_at_heure': updated_at_heure});
    result.addAll({'montant': montant});
    result.addAll({'paye': paye});
    result.addAll({'user_uid': user_uid});

    return result;
  }

  factory VentesACredits.fromMap(Map<String, dynamic> map) {
    return VentesACredits(
      uid: map['uid'] ?? '',
      nom_client: map['nom_client'] ?? '',
      achat_effectue: map['achat_effectue'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      updated_at: map['updated_at'] ?? '',
      updated_at_heure: map['updated_at_heure'] ?? '',
      montant: map['montant']?.toInt() ?? 0,
      paye: map['paye'] ?? false,
      user_uid: map['user_uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VentesACredits.fromJson(String source) =>
      VentesACredits.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VentesACredits(uid: $uid, nom_client: $nom_client, achat_effectue: $achat_effectue, description: $description, created_at: $created_at, created_at_heure: $created_at_heure, updated_at: $updated_at, updated_at_heure: $updated_at_heure, montant: $montant, paye: $paye, user_uid: $user_uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VentesACredits &&
        other.uid == uid &&
        other.nom_client == nom_client &&
        other.achat_effectue == achat_effectue &&
        other.description == description &&
        other.created_at == created_at &&
        other.created_at_heure == created_at_heure &&
        other.updated_at == updated_at &&
        other.updated_at_heure == updated_at_heure &&
        other.montant == montant &&
        other.paye == paye &&
        other.user_uid == user_uid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nom_client.hashCode ^
        achat_effectue.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        created_at_heure.hashCode ^
        updated_at.hashCode ^
        updated_at_heure.hashCode ^
        montant.hashCode ^
        paye.hashCode ^
        user_uid.hashCode;
  }
}
