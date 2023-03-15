// ignore_for_file: camel_case_types, dead_code, prefer_final_fields, prefer_typing_uninitialized_variables, empty_constructor_bodies, non_constant_identifier_names, unused_local_variable, unused_element, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/modele/achat_poussins.dart';
import 'package:deogracias/modele/appreciations.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:deogracias/modele/depense.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/pertes.dart';
import 'package:deogracias/modele/services.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

import '../modele/assistances.dart';
import '../modele/budget_tiers.dart';
import '../modele/poussins.dart';
import '../modele/problemes.dart';
import '../modele/vagues.dart';
import '../modele/ventes_a_credits.dart';
import '../services/user.dart';

class serviceBD {
  final FirebaseFirestore _Ref = FirebaseFirestore.instance;
// user data
  Stream<donnesUtilisateur> user_data(String user_uid) {
    return _Ref.collection("users")
        .doc(user_uid)
        .snapshots()
        .map((snap) => donnesUtilisateur.fromFiresotre(snap));
  }

  Stream<donnesUtilisateur> get currentuserdata {
    return _Ref.collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((event) => donnesUtilisateur.fromFiresotre(event));
  }

  Stream<BudgetTiers> budget_tiers(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("budget")
        .doc("budget_tiers")
        .snapshots()
        .map((event) => BudgetTiers.FromFirestore(event));
  }

  Stream<List<Vagues>> get list_des_vagues {
    return _Ref.collection("vagues")
        .orderBy("created_at", descending: true)
        .orderBy("nom", descending: true)
        .snapshots()
        .map(
            (event) => event.docs.map((e) => Vagues.FromFirestore(e)).toList());
  }

  Stream<Vagues> vague(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .snapshots()
        .map((event) => Vagues.FromFirestore(event));
  }

  Stream<List<donnesUtilisateur>> get list_des_utilisateur {
    return _Ref.collection("users")
        .where("deleted", isEqualTo: false)
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((documents) => documents.docs
            .map((snap) => donnesUtilisateur.fromFiresotre(snap))
            .toList());
  }

  Stream<List<Clients>> get list_des_clients {
    return _Ref.collection("clients")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Clients.fromFirestore(e)).toList());
  }

  Stream<Clients> client(String client_uid) {
    return _Ref.collection("clients")
        .doc(client_uid)
        .snapshots()
        .map((event) => Clients.fromFirestore(event));
  }

  Stream<List<Commandes>> get toutes_les_commandes {
    return _Ref.collection("commandes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Commandes.fromFirestore(e)).toList());
  }

  Stream<List<Commandes>> commandes_du_client(String client_uid) {
    return _Ref.collection("commandes")
        .where("client_uid", isEqualTo: client_uid)
        // .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Commandes.fromFirestore(e)).toList());
  }

  Stream<Commandes> commande(String commande_uid) {
    return _Ref.collection("commandes")
        .doc(commande_uid)
        .snapshots()
        .map((event) => Commandes.fromFirestore(event));
  }

  Stream<Budget> get budget {
    return _Ref.collection("budget")
        .doc("budget")
        .snapshots()
        .map((event) => Budget.FromFirestore(event));
  }

  Stream<List<Appreciations>> get list_des_appreciations {
    return _Ref.collection("appreciations")
        .orderBy("created_at", descending: true)
        .orderBy("appreciation", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Appreciations.FromFirestore(e)).toList());
  }

  Stream<Appreciations> appreciation(String appreciation_uid) {
    return _Ref.collection("appreciations")
        .doc(appreciation_uid)
        .snapshots()
        .map((event) => Appreciations.FromFirestore(event));
  }

  Stream<PoussinsUnJour> poussin(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("poussins")
        .doc("poussin")
        .snapshots()
        .map((event) => PoussinsUnJour.FromFirestore(event));
  }

  Stream<List<PoussinsUnJour>> list_poussins(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("poussins")
        .snapshots()
        .map((event) =>
            event.docs.map((e) => PoussinsUnJour.FromFirestore(e)).toList());
  }

  Stream<List<AchatPoussins>> achats_poussins(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("achat_poussins")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => AchatPoussins.FromFirestore(e)).toList());
  }

  Stream<AchatPoussins> achat_poussin(
      String vague_uid, String achat_poussin_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("achat_poussins")
        .doc(achat_poussin_uid)
        .snapshots()
        .map((event) => AchatPoussins.FromFirestore(event));
  }

  Stream<List<Betes>> list_des_betes(String vzgue_uid) {
    return _Ref.collection("vagues")
        .doc(vzgue_uid)
        .collection("betes")
        .orderBy("created_at", descending: true)
        .orderBy("nom", descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => Betes.FromFirestore(e)).toList());
  }

  Stream<Betes> bete(String vague_uid, String bete_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("betes")
        .doc(bete_uid)
        .snapshots()
        .map((event) => Betes.FromFirestore(event));
  }

  Stream<List<VenteBetes>> list_vente_betes(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("vente_betes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => VenteBetes.FromFirestore(e)).toList());
  }

  Stream<VenteBetes> vente_bete(String vague_uid, String vente_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("vente_betes")
        .doc(vente_uid)
        .snapshots()
        .map((event) => VenteBetes.FromFirestore(event));
  }

  Stream<List<Fientes>> list_fientes(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("fientes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Fientes.FromFirestore(e)).toList());
  }

  Stream<Fientes> fiente(String vague_uid, String fiente_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("fientes")
        .doc(fiente_uid)
        .snapshots()
        .map((event) => Fientes.FromFirestore(event));
  }

  Stream<List<VenteFientes>> list_vente_fiente(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("vente_fientes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => VenteFientes.FromFirestore(e)).toList());
  }

  Stream<VenteFientes> vente_fiente(String vague_uid, String vente_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("vente_fientes")
        .doc(vente_uid)
        .snapshots()
        .map((event) => VenteFientes.FromFirestore(event));
  }

  Stream<OeufTables> oeuf_table(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("oeuf_tables")
        .doc("oeuf_de_table")
        .snapshots()
        .map((event) => OeufTables.FromFirestore(event));
  }

  Stream<List<OeufTables>> list_oeuf_table(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("oeuf_tables")
        .snapshots()
        .map((event) =>
            event.docs.map((e) => OeufTables.FromFirestore(e)).toList());
  }

  Stream<List<VenteOeufTables>> list_vente_oeufs_tables(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("vente_oeuf_tables")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => VenteOeufTables.FromFirestore(e)).toList());
  }

  Stream<VenteOeufTables> vente_oeuf_table(String vague_uid, String vente_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("vente_oeuf_tables")
        .doc(vente_uid)
        .snapshots()
        .map((event) => VenteOeufTables.FromFirestore(event));
  }

  Stream<List<Depenses>> list_depenses(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("depenses")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Depenses.FromFirestore(e)).toList());
  }

  Stream<List<Depenses>> depenses_utilisateur(
      String vague_uid, String user_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("depenses")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Depenses.FromFirestore(e)).toList());
  }

  Stream<Depenses> depense(String vague_uid, String depense_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("depenses")
        .doc(depense_uid)
        .snapshots()
        .map((event) => Depenses.FromFirestore(event));
  }

  Stream<List<Pertes>> list_des_pertes(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("pertes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map(
            (event) => event.docs.map((e) => Pertes.FromFirestore(e)).toList());
  }

  Stream<List<Pertes>> pertes_utilisateur(String vague_uid, String user_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("pertes")
        .where("user_uid", isEqualTo: user_uid)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map(
            (event) => event.docs.map((e) => Pertes.FromFirestore(e)).toList());
  }

  Stream<Pertes> perte(String vague_uid, String perte_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("pertes")
        .doc(perte_uid)
        .snapshots()
        .map((event) => Pertes.FromFirestore(event));
  }

  Stream<List<Services>> get list_des_services {
    return _Ref.collection("services")
        .orderBy("created_at", descending: true)
        .orderBy("nom", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Services.FromFirestore(e)).toList());
  }

  Stream<Services> service(String service_uid) {
    return _Ref.collection("services")
        .doc(service_uid)
        .snapshots()
        .map((event) => Services.FromFirestore(event));
  }

  Stream<List<Assistances>> get list_des_assistances {
    return _Ref.collection("assistances")
        .orderBy("created_at", descending: true)
        .orderBy("repondu", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Assistances.FromFirestore(e)).toList());
  }

  Stream<Assistances> assistance(String assistance_uid) {
    return _Ref.collection("assistances")
        .doc(assistance_uid)
        .snapshots()
        .map((event) => Assistances.FromFirestore(event));
  }

  Stream<List<VentesACredits>> list_des_ventes_a_credits(String vague_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("ventes_a_credits")
        .orderBy("created_at", descending: true)
        .orderBy("nom", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => VentesACredits.FromFirestore(e)).toList());
  }

  Stream<VentesACredits> vente_a_credit(
      String vague_uid, String vente_a_credit_uid) {
    return _Ref.collection("vagues")
        .doc(vague_uid)
        .collection("ventes_a_credits")
        .doc(vente_a_credit_uid)
        .snapshots()
        .map((event) => VentesACredits.FromFirestore(event));
  }

  Stream<List<Problemes>> get list_des_problemes {
    return _Ref.collection("problemes")
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Problemes.FromFirestore(e)).toList());
  }

  Stream<Problemes> probleme(String probleme_uid) {
    return _Ref.collection("problemes")
        .doc(probleme_uid)
        .snapshots()
        .map((event) => Problemes.FromFirestore(event));
  }
}
