// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Budget {
  String uid;
  int solde_total;
  int depense;
  int perte;
  Budget({
    required this.uid,
    required this.solde_total,
    required this.depense,
    required this.perte,
  });

  factory Budget.FromFirestore(DocumentSnapshot document) {
    return Budget(
        uid: document.id,
        solde_total: (document.data() as Map)['solde_total'],
        depense: (document.data() as Map)['depense'],
        perte: (document.data() as Map)['perte']);
  }

  Budget copyWith({
    String? uid,
    int? solde_total,
    int? depense,
    int? perte,
  }) {
    return Budget(
      uid: uid ?? this.uid,
      solde_total: solde_total ?? this.solde_total,
      depense: depense ?? this.depense,
      perte: perte ?? this.perte,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'solde_total': solde_total});
    result.addAll({'depense': depense});
    result.addAll({'perte': perte});

    return result;
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      uid: map['uid'] ?? '',
      solde_total: map['solde_total']?.toInt() ?? 0,
      depense: map['depense']?.toInt() ?? 0,
      perte: map['perte']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Budget(uid: $uid, solde_total: $solde_total, depense: $depense, perte: $perte)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Budget &&
        other.uid == uid &&
        other.solde_total == solde_total &&
        other.depense == depense &&
        other.perte == perte;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        solde_total.hashCode ^
        depense.hashCode ^
        perte.hashCode;
  }
}
