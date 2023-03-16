// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/ventes_a_credits.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenteACreditPaye extends StatelessWidget {
  const VenteACreditPaye({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final vente_a_credit = Provider.of<VentesACredits>(context);
    final budget = Provider.of<Budget>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);
    return Scaffold(
      drawer: DrawerVagueAdmin(vague_uid: vague_uid),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Vente à crédit",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/image2.jpeg",
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Vente à crédit ",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.89,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade900),
                        onPressed: () {},
                        child: Text(
                          "Informations sur la vente".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nom du client",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.nom_client,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Achat éffectué",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.achat_effectue,
                            maxLines: 8,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description de l'achat :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.description,
                            maxLines: 25,
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Montant de l'achat",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.montant.toString() + " XOF",
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date de vente :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.created_at +
                                " à " +
                                vente_a_credit.created_at_heure,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Statut du crédit",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.paye
                                ? "Payé".toUpperCase()
                                : "Non payé".toUpperCase(),
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: vente_a_credit.paye
                                    ? Colors.green.shade800
                                    : Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  vente_a_credit.paye
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payé le :",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: Text(
                                  vente_a_credit.updated_at +
                                      " à " +
                                      vente_a_credit.updated_at_heure,
                                  maxLines: 2,
                                  softWrap: true,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade800,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vente enregistré par :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            user.prenom + " " + user.nom,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            user.telephone,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Adresse E-Mail",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            user.email,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !vente_a_credit.paye
                      ? SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.89,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue.shade900),
                              onPressed: () {
                                ConfirmPayeCredit(
                                    context,
                                    vente_a_credit.nom_client,
                                    vente_a_credit.uid,
                                    vente_a_credit.achat_effectue,
                                    vente_a_credit.montant,
                                    budget.uid,
                                    budget.solde_total,
                                    budget_tiers.uid,
                                    budget_tiers.solde_total,
                                    vague_uid);
                              },
                              child: Text(
                                "Payez le crédit".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      : Container(),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Future<void> ConfirmPayeCredit(
      BuildContext context,
      String vente_a_credit_nom_client,
      String vente_a_credit_uid,
      String vente_a_credit_achat_effectue,
      int montant,
      String budget_uid,
      int budget_solde_total,
      String budget_tiers_uid,
      int budget_tiers_solde_total,
      String vague_uid) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text("Etes vous sur ?".toUpperCase()),
            content: SingleChildScrollView(
              child: ListBody(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text("Le client " +
                      vente_a_credit_nom_client +
                      " veut il vraiment payer son crédit d'achat de " +
                      vente_a_credit_achat_effectue +
                      " qui s'élève à " +
                      montant.toString() +
                      " XOF ?"),
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
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(vague_uid)
                                .collection("ventes_a_credits")
                                .doc(vente_a_credit_uid)
                                .update({
                              "updated_at": DateTime.now(),
                              "paye": true
                            });
                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(budget_uid)
                                .update({
                              "solde_total": budget_solde_total + montant,
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(vague_uid)
                                .collection("budgetb")
                                .doc(budget_tiers_uid)
                                .update({
                              "solde_total": budget_tiers_solde_total + montant
                            });

                            _speak(
                                "Le statut du crédit a été modifié avec succès");
                            Navigator.of(context).pop();

                            // ignore: empty_catches
                          } catch (e) {
                            _speak("Une erreur inattendue s'est produite");
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
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () {
                          _speak("Modification du statut du crédit annulé");
                          Navigator.of(context).pop();
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
        });
  }

  Future _speak(String text) async {
    final FlutterTts flutter_tts = FlutterTts();
    flutter_tts.setLanguage("Fr");
    flutter_tts.setSpeechRate(0.5);
    flutter_tts.setVolume(0.5);
    flutter_tts.setPitch(1.0);
    flutter_tts.speak(text);
  }
}
