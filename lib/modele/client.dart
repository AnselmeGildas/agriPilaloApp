// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Clients {
  final String uid;
  final String email;
  final String numero;
  final String nom;
  final String departement;
  final String commune;
  final String arrondissement;
  final String created_at;
  int nombre_commande;
  Clients({
    required this.uid,
    required this.email,
    required this.numero,
    required this.nom,
    required this.departement,
    required this.commune,
    required this.arrondissement,
    required this.created_at,
    required this.nombre_commande,
  });

  factory Clients.fromFirestore(DocumentSnapshot document) {
    Timestamp dt = (document.data() as Map)['created_at'];
    return Clients(
        nombre_commande: (document.data() as Map)['nombre_commande'],
        created_at: DateFormat("dd-MM-yyyy").format(dt.toDate()),
        uid: document.id,
        email: (document.data() as Map<String, dynamic>)['email'],
        numero: (document.data() as Map)['numero'],
        nom: (document.data() as Map<String, dynamic>)['nom'],
        departement: (document.data() as Map<String, dynamic>)['departement'],
        commune: (document.data() as Map<String, dynamic>)['commune'],
        arrondissement:
            (document.data() as Map<String, dynamic>)['arrondissement']);
  }

  Clients copyWith({
    String? uid,
    String? email,
    String? numero,
    String? nom,
    String? departement,
    String? commune,
    String? arrondissement,
    String? created_at,
    int? nombre_commande,
  }) {
    return Clients(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      numero: numero ?? this.numero,
      nom: nom ?? this.nom,
      departement: departement ?? this.departement,
      commune: commune ?? this.commune,
      arrondissement: arrondissement ?? this.arrondissement,
      created_at: created_at ?? this.created_at,
      nombre_commande: nombre_commande ?? this.nombre_commande,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'email': email});
    result.addAll({'numero': numero});
    result.addAll({'nom': nom});
    result.addAll({'departement': departement});
    result.addAll({'commune': commune});
    result.addAll({'arrondissement': arrondissement});
    result.addAll({'created_at': created_at});
    result.addAll({'nombre_commande': nombre_commande});

    return result;
  }

  factory Clients.fromMap(Map<String, dynamic> map) {
    return Clients(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      numero: map['numero'] ?? '',
      nom: map['nom'] ?? '',
      departement: map['departement'] ?? '',
      commune: map['commune'] ?? '',
      arrondissement: map['arrondissement'] ?? '',
      created_at: map['created_at'] ?? '',
      nombre_commande: map['nombre_commande']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clients.fromJson(String source) =>
      Clients.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Clients(uid: $uid, email: $email, numero: $numero, nom: $nom, departement: $departement, commune: $commune, arrondissement: $arrondissement, created_at: $created_at, nombre_commande: $nombre_commande)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Clients &&
        other.uid == uid &&
        other.email == email &&
        other.numero == numero &&
        other.nom == nom &&
        other.departement == departement &&
        other.commune == commune &&
        other.arrondissement == arrondissement &&
        other.created_at == created_at &&
        other.nombre_commande == nombre_commande;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        numero.hashCode ^
        nom.hashCode ^
        departement.hashCode ^
        commune.hashCode ^
        arrondissement.hashCode ^
        created_at.hashCode ^
        nombre_commande.hashCode;
  }
}
