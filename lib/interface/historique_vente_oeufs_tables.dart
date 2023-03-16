// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/stream_historique_vente_oeuf_table.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoriqueVentesOeufsTables extends StatelessWidget {
  const HistoriqueVentesOeufsTables({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    final vente_oeuf_tables = Provider.of<List<VenteOeufTables>>(context);
    final budget = Provider.of<Budget>(context);
    final oeuf = Provider.of<OeufTables>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);
    if (vente_oeuf_tables.isEmpty) {
      return Scaffold(
        drawer: DrawerVagueAdmin(vague_uid: vague_uid),
        backgroundColor: Colors.green.shade800,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Ventes oeufs",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          centerTitle: true,
          actions: [
            Image.asset(
              "images/icon2.jpg",
              height: 70,
              width: 70,
              scale: 4.5,
            )
          ],
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      drawer: DrawerVagueAdmin(vague_uid: vague_uid),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Oeufs de table",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        centerTitle: true,
        actions: [
          Image.asset(
            "images/icon2.jpg",
            height: 70,
            width: 70,
            scale: 4.5,
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          VenteOeufTables vente = vente_oeuf_tables[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamHistoriqueVenteOeufTable(
                      vente_uid: vente.uid,
                      user_uid: vente.user_uid,
                      vague_uid: vague_uid,
                    ),
                  ));
            },
            title: vente.unite
                ? Text(
                    "Ventes de " +
                        vente.nombre.toString() +
                        " unités d'oeuf de tables",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.alike(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "Ventes de " +
                        vente.nombre.toString() +
                        " plateaux d'oeuf de tables",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.alike(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
            trailing: IconButton(
                onPressed: () {
                  _DeleteVenteOeufTable(
                      context,
                      oeuf.nom,
                      oeuf.uid,
                      vente.uid,
                      vente.montant,
                      vente.nombre,
                      vente.created_at,
                      vente.cretaed_at_heure,
                      budget.uid,
                      budget.solde_total,
                      oeuf.montant_vendu,
                      oeuf.nombre_restant,
                      budget_tiers.uid,
                      budget_tiers.solde_total,
                      vague_uid);
                },
                icon: Icon(Icons.delete)),
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue.shade900,
              child: Text(
                "OT",
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.sell_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  vente.created_at + " à " + vente.cretaed_at_heure,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: vente_oeuf_tables.length,
      ),
    );
  }

  Future<void> _DeleteVenteOeufTable(
      BuildContext context,
      String oeuf_nom,
      String oeuf_uid,
      String vente_oeuf_uid,
      int montant,
      int nombre,
      String created_at,
      String created_at_heure,
      String budget_uid,
      int budget_montant,
      int oeuf_montant_vendu,
      int oeuf_nombre_restant,
      String budget_tiers_uid,
      int budget_tiers_solde_total,
      String vague_uid) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            "Suppression de vente".toUpperCase(),
            style: GoogleFonts.alike(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Vous etes sur le point de supprimer la vente de " +
                      oeuf_nom +
                      " éffectuée le " +
                      created_at +
                      " à " +
                      created_at_heure +
                      " qui s'élève à " +
                      montant.toString() +
                      " XOF",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Confirmer'.toUpperCase(),
                          style: GoogleFonts.alike(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          _speak("Suppression en cours");

                          await FirebaseFirestore.instance
                              .collection("budget")
                              .doc(budget_uid)
                              .update(
                                  {"solde_total": budget_montant - montant});
                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("budget")
                              .doc(budget_tiers_uid)
                              .update({
                            "solde_total": budget_tiers_solde_total - montant
                          });
                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("vente_oeuf_tables")
                              .doc(vente_oeuf_uid)
                              .delete();
                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("oeuf_tables")
                              .doc(oeuf_uid)
                              .update({
                            "nombre_restant": oeuf_nombre_restant + nombre,
                            "montant_vendu": oeuf_montant_vendu - montant,
                          });

                          _speak("Suppression effectué avec succès");
                          Navigator.of(dialogContext).pop();

                          // ignore: empty_catches
                        } catch (e) {
                          _speak("une erreur s'est produite");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(.7),
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Annuler'.toUpperCase(),
                          style: GoogleFonts.alike(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        _speak("Suppression de la vente annulée");
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }

  Future _speak(String text) async {
    final FlutterTts _flutter_tts = FlutterTts();
    _flutter_tts.setLanguage("Fr");
    _flutter_tts.setSpeechRate(0.5);
    _flutter_tts.setVolume(0.5);
    _flutter_tts.setPitch(1.0);
    _flutter_tts.speak(text);
  }
}
