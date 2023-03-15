// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Assistances {
  final String nom;
  final String numero;
  final String email;
  final String uid;
  final String message;
  final bool repondu;
  final String created_at;
  final String created_at_heure;
  Assistances({
    required this.nom,
    required this.numero,
    required this.email,
    required this.uid,
    required this.message,
    required this.repondu,
    required this.created_at,
    required this.created_at_heure,
  });

  factory Assistances.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    return Assistances(
        nom: (document.data() as Map<String, dynamic>)['nom'],
        numero: (document.data() as Map<String, dynamic>)['numero'],
        email: (document.data() as Map<String, dynamic>)['email'],
        uid: document.id,
        message: (document.data() as Map<String, dynamic>)['message'],
        repondu: (document.data() as Map)['repondu'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()),
        created_at_heure: DateFormat("HH:mm:ss").format(created.toDate()));
  }

  Assistances copyWith({
    String? nom,
    String? numero,
    String? email,
    String? uid,
    String? message,
    bool? repondu,
    String? created_at,
    String? created_at_heure,
  }) {
    return Assistances(
      nom: nom ?? this.nom,
      numero: numero ?? this.numero,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      message: message ?? this.message,
      repondu: repondu ?? this.repondu,
      created_at: created_at ?? this.created_at,
      created_at_heure: created_at_heure ?? this.created_at_heure,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nom': nom});
    result.addAll({'numero': numero});
    result.addAll({'email': email});
    result.addAll({'uid': uid});
    result.addAll({'message': message});
    result.addAll({'repondu': repondu});
    result.addAll({'created_at': created_at});
    result.addAll({'created_at_heure': created_at_heure});

    return result;
  }

  factory Assistances.fromMap(Map<String, dynamic> map) {
    return Assistances(
      nom: map['nom'] ?? '',
      numero: map['numero'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      message: map['message'] ?? '',
      repondu: map['repondu'] ?? false,
      created_at: map['created_at'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Assistances.fromJson(String source) =>
      Assistances.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Assistances(nom: $nom, numero: $numero, email: $email, uid: $uid, message: $message, repondu: $repondu, created_at: $created_at, created_at_heure: $created_at_heure)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Assistances &&
        other.nom == nom &&
        other.numero == numero &&
        other.email == email &&
        other.uid == uid &&
        other.message == message &&
        other.repondu == repondu &&
        other.created_at == created_at &&
        other.created_at_heure == created_at_heure;
  }

  @override
  int get hashCode {
    return nom.hashCode ^
        numero.hashCode ^
        email.hashCode ^
        uid.hashCode ^
        message.hashCode ^
        repondu.hashCode ^
        created_at.hashCode ^
        created_at_heure.hashCode;
  }
}
