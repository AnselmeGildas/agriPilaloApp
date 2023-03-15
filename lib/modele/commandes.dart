// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Commandes {
  final String uid;
  final String achat;
  final String description;
  final String created_at;
  final String updated_at;
  final String date_livraison;
  final String heure_livraison;
  final String created_at_heure;
  final String updated_at_heure;
  final String since;
  final bool venir_chercher_commande;
  final bool supporter_frais_transports;
  final String client_uid;
  final String coordonnees_gps;
  final String indication;
  final String exigences;
  final bool traite;
  Commandes({
    required this.uid,
    required this.achat,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.date_livraison,
    required this.heure_livraison,
    required this.created_at_heure,
    required this.updated_at_heure,
    required this.since,
    required this.venir_chercher_commande,
    required this.supporter_frais_transports,
    required this.client_uid,
    required this.coordonnees_gps,
    required this.indication,
    required this.exigences,
    required this.traite,
  });

  factory Commandes.fromFirestore(DocumentSnapshot document) {
    Timestamp dt = (document.data() as Map)['created_at'];
    Timestamp dat = (document.data() as Map)['updated_at'];

    return Commandes(
        heure_livraison:
            (document.data() as Map<String, dynamic>)['heure_livraison'],
        traite: (document.data() as Map)['traite'],
        exigences: (document.data() as Map<String, dynamic>)['exigences'],
        coordonnees_gps:
            (document.data() as Map<String, dynamic>)['coordonnees_gps'],
        indication: (document.data() as Map<String, dynamic>)['indication'],
        client_uid: (document.data() as Map<String, dynamic>)['client_uid'],
        venir_chercher_commande:
            (document.data() as Map)['venir_chercher_commande'],
        supporter_frais_transports:
            (document.data() as Map)['supporter_frais_transport'],
        since: DateFormat('HH:mm:ss').format(dt.toDate()),
        created_at_heure: DateFormat('HH:mm:ss').format(dt.toDate()),
        updated_at_heure: DateFormat('HH:mm:ss').format(dat.toDate()),
        uid: document.id,
        achat: (document.data() as Map<String, dynamic>)['achat'],
        description: (document.data() as Map<String, dynamic>)['description'],
        created_at: DateFormat('dd-MM-yyyy').format(dt.toDate()),
        updated_at: DateFormat('dd-MM-yyyy').format(dat.toDate()),
        date_livraison: (document.data() as Map)['date_livraison']);
  }

  Commandes copyWith({
    String? uid,
    String? achat,
    String? description,
    String? created_at,
    String? updated_at,
    String? date_livraison,
    String? heure_livraison,
    String? created_at_heure,
    String? updated_at_heure,
    String? since,
    bool? venir_chercher_commande,
    bool? supporter_frais_transports,
    String? client_uid,
    String? coordonnees_gps,
    String? indication,
    String? exigences,
    bool? traite,
  }) {
    return Commandes(
      uid: uid ?? this.uid,
      achat: achat ?? this.achat,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      date_livraison: date_livraison ?? this.date_livraison,
      heure_livraison: heure_livraison ?? this.heure_livraison,
      created_at_heure: created_at_heure ?? this.created_at_heure,
      updated_at_heure: updated_at_heure ?? this.updated_at_heure,
      since: since ?? this.since,
      venir_chercher_commande:
          venir_chercher_commande ?? this.venir_chercher_commande,
      supporter_frais_transports:
          supporter_frais_transports ?? this.supporter_frais_transports,
      client_uid: client_uid ?? this.client_uid,
      coordonnees_gps: coordonnees_gps ?? this.coordonnees_gps,
      indication: indication ?? this.indication,
      exigences: exigences ?? this.exigences,
      traite: traite ?? this.traite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'achat': achat});
    result.addAll({'description': description});
    result.addAll({'created_at': created_at});
    result.addAll({'updated_at': updated_at});
    result.addAll({'date_livraison': date_livraison});
    result.addAll({'heure_livraison': heure_livraison});
    result.addAll({'created_at_heure': created_at_heure});
    result.addAll({'updated_at_heure': updated_at_heure});
    result.addAll({'since': since});
    result.addAll({'venir_chercher_commande': venir_chercher_commande});
    result.addAll({'supporter_frais_transports': supporter_frais_transports});
    result.addAll({'client_uid': client_uid});
    result.addAll({'coordonnees_gps': coordonnees_gps});
    result.addAll({'indication': indication});
    result.addAll({'exigences': exigences});
    result.addAll({'traite': traite});

    return result;
  }

  factory Commandes.fromMap(Map<String, dynamic> map) {
    return Commandes(
      uid: map['uid'] ?? '',
      achat: map['achat'] ?? '',
      description: map['description'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      date_livraison: map['date_livraison'] ?? '',
      heure_livraison: map['heure_livraison'] ?? '',
      created_at_heure: map['created_at_heure'] ?? '',
      updated_at_heure: map['updated_at_heure'] ?? '',
      since: map['since'] ?? '',
      venir_chercher_commande: map['venir_chercher_commande'] ?? false,
      supporter_frais_transports: map['supporter_frais_transports'] ?? false,
      client_uid: map['client_uid'] ?? '',
      coordonnees_gps: map['coordonnees_gps'] ?? '',
      indication: map['indication'] ?? '',
      exigences: map['exigences'] ?? '',
      traite: map['traite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Commandes.fromJson(String source) =>
      Commandes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Commandes(uid: $uid, achat: $achat, description: $description, created_at: $created_at, updated_at: $updated_at, date_livraison: $date_livraison, heure_livraison: $heure_livraison, created_at_heure: $created_at_heure, updated_at_heure: $updated_at_heure, since: $since, venir_chercher_commande: $venir_chercher_commande, supporter_frais_transports: $supporter_frais_transports, client_uid: $client_uid, coordonnees_gps: $coordonnees_gps, indication: $indication, exigences: $exigences, traite: $traite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Commandes &&
        other.uid == uid &&
        other.achat == achat &&
        other.description == description &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.date_livraison == date_livraison &&
        other.heure_livraison == heure_livraison &&
        other.created_at_heure == created_at_heure &&
        other.updated_at_heure == updated_at_heure &&
        other.since == since &&
        other.venir_chercher_commande == venir_chercher_commande &&
        other.supporter_frais_transports == supporter_frais_transports &&
        other.client_uid == client_uid &&
        other.coordonnees_gps == coordonnees_gps &&
        other.indication == indication &&
        other.exigences == exigences &&
        other.traite == traite;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        achat.hashCode ^
        description.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        date_livraison.hashCode ^
        heure_livraison.hashCode ^
        created_at_heure.hashCode ^
        updated_at_heure.hashCode ^
        since.hashCode ^
        venir_chercher_commande.hashCode ^
        supporter_frais_transports.hashCode ^
        client_uid.hashCode ^
        coordonnees_gps.hashCode ^
        indication.hashCode ^
        exigences.hashCode ^
        traite.hashCode;
  }
}
