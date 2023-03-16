// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/stream_historique_de_vente_de_fiente.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoriqueVentesFientes extends StatelessWidget {
  const HistoriqueVentesFientes({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    final ventes_fientes = Provider.of<List<VenteFientes>>(context);
    final budget = Provider.of<Budget>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);
    if (ventes_fientes.isEmpty) {
      return Scaffold(
        drawer: DrawerVagueAdmin(vague_uid: vague_uid),
        backgroundColor: Colors.green.shade800,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Vente fientes",
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
          "Ventes fientes",
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
          VenteFientes vente = ventes_fientes[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamHistoriqueVenteFiente(
                        vague_uid: vague_uid,
                        vente_uid: vente.uid,
                        user_uid: vente.user_uid,
                        fiente_uid: vente.fiente_uid),
                  ));
            },
            title: Text(
              "Vente de " + vente.nombre.toString() + " fientes",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.alike(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue.shade900,
              child: Text(
                "FI".toUpperCase(),
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  _DeleteVenteFiente(
                      context,
                      vente.fiente_uid,
                      vente.uid,
                      vente.montant,
                      vente.nombre,
                      vente.created_at,
                      vente.created_at_heure,
                      budget.uid,
                      budget.solde_total,
                      budget_tiers.uid,
                      budget_tiers.solde_total,
                      vague_uid);
                },
                icon: Icon(Icons.delete)),
            subtitle: Row(
              children: [
                Icon(Icons.sell_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  vente.created_at + " à " + vente.created_at_heure,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: ventes_fientes.length,
      ),
    );
  }

  Future<void> _DeleteVenteFiente(
      BuildContext context,
      String fiente_uid,
      String vente_uid,
      int montant,
      int nombre,
      String created_at,
      String created_at_heure,
      String budget_uid,
      int budget_montant,
      String budget_tiers_uid,
      int budget_tiers_solde_total,
      String vague_uid) async {
    int _bete_nombre_restant = 0;
    int _bete_montant_vendu = 0;
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
                      nombre.toString() +
                      " sacks de fiente " +
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
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("fientes")
                              .doc(fiente_uid)
                              .get()
                              .then((DocumentSnapshot document) {
                            _bete_nombre_restant =
                                (document.data() as Map)['nombre_restant'];
                            _bete_montant_vendu =
                                (document.data() as Map)['montant_vendu'];
                          });

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
                              .collection("vente_fientes")
                              .doc(vente_uid)
                              .delete();
                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("fientes")
                              .doc(fiente_uid)
                              .update({
                            "nombre_restant": _bete_nombre_restant + nombre,
                            "montant_vendu": _bete_montant_vendu - montant,
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
