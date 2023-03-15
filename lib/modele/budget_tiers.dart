// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BudgetTiers {
  String uid;
  int solde_total;
  int depense;
  int perte;
  String created_at;
  BudgetTiers({
    required this.uid,
    required this.solde_total,
    required this.depense,
    required this.perte,
    required this.created_at,
  });

  factory BudgetTiers.FromFirestore(DocumentSnapshot document) {
    Timestamp created = (document.data() as Map)['created_at'];
    return BudgetTiers(
        uid: document.id,
        solde_total: (document.data() as Map)['solde_total'],
        depense: (document.data() as Map)['depense'],
        perte: (document.data() as Map)['perte'],
        created_at: DateFormat("dd-MM-yyyy").format(created.toDate()));
  }

  BudgetTiers copyWith({
    String? uid,
    int? solde_total,
    int? depense,
    int? perte,
    String? created_at,
  }) {
    return BudgetTiers(
      uid: uid ?? this.uid,
      solde_total: solde_total ?? this.solde_total,
      depense: depense ?? this.depense,
      perte: perte ?? this.perte,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'solde_total': solde_total});
    result.addAll({'depense': depense});
    result.addAll({'perte': perte});
    result.addAll({'created_at': created_at});

    return result;
  }

  factory BudgetTiers.fromMap(Map<String, dynamic> map) {
    return BudgetTiers(
      uid: map['uid'] ?? '',
      solde_total: map['solde_total']?.toInt() ?? 0,
      depense: map['depense']?.toInt() ?? 0,
      perte: map['perte']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BudgetTiers.fromJson(String source) =>
      BudgetTiers.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BudgetTiers(uid: $uid, solde_total: $solde_total, depense: $depense, perte: $perte, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BudgetTiers &&
        other.uid == uid &&
        other.solde_total == solde_total &&
        other.depense == depense &&
        other.perte == perte &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        solde_total.hashCode ^
        depense.hashCode ^
        perte.hashCode ^
        created_at.hashCode;
  }
}
