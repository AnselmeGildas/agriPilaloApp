// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/provider/provider_vente_a_credit.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class EnregisterUneVenteAcredit extends StatefulWidget {
  const EnregisterUneVenteAcredit({super.key});

  @override
  State<EnregisterUneVenteAcredit> createState() =>
      _EnregisterUneVenteAcreditState();
}

class _EnregisterUneVenteAcreditState extends State<EnregisterUneVenteAcredit> {
  TextEditingController nom_client_saisie = TextEditingController();

  TextEditingController achat_saisie = TextEditingController();

  TextEditingController description_saisie = TextEditingController();

  TextEditingController montant_saisie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool affiche = false;
    String nom_client = "";
    String achat = "";
    String description = "";
    String montant = "";
    int _montant = 0;
    final user = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderVenteACredit>(context);
    affiche = provider.affiche;
    nom_client = provider.nom;
    achat = provider.achat;
    description = provider.description;
    montant = provider.montant;
    _montant = provider.montant.isNotEmpty ? int.parse(provider.montant) : 0;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerAdmin(),
      appBar: AppBar(
        actions: [
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Vente à crédit",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
              height: MediaQuery.of(context).size.height * 0.3,
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
              "Vente à crédit éffectuée ",
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
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nom du client ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak("nom et prénom du client ");
                },
                controller: nom_client_saisie,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: nom_client.isEmpty || nom_client.length < 3
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_nom(value, nom_client_saisie);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Achat éffectuée ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak("Qu'a t'il achété ? ");
                },
                controller: achat_saisie,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: achat.isEmpty
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_achat(
                    value,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description de la vente éffectuée ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak("Décrivez brièvement la vente éffectuée ");
                },
                controller: description_saisie,
                autocorrect: true,
                enableSuggestions: true,
                maxLines: 7,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: description.isEmpty
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_description(
                    value,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Montant de l'achat ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: montant_saisie,
                autocorrect: true,
                enableSuggestions: true,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: montant.isEmpty
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_montant(
                    value,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.92,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () async {
                    try {
                      provider.affiche_true();

                      if (nom_client_saisie.text.isEmpty ||
                          achat_saisie.text.isEmpty ||
                          description_saisie.text.isEmpty ||
                          montant_saisie.text.isEmpty ||
                          _montant <= 0) {
                        provider.affiche_false();
                        _speak("Vous devez bien renseigner les champs");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez bien renseigner les champs",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      } else {
                        await FirebaseFirestore.instance
                            .collection("ventes_a_credits")
                            .add({
                          "created_at": DateTime.now(),
                          "nom": nom_client_saisie.text,
                          "achat": achat_saisie.text,
                          "description": description_saisie.text,
                          "montant": _montant,
                          "paye": false,
                          "updated_at": DateTime.now(),
                          "user_uid": user.uid
                        });

                        nom_client_saisie.clear();
                        achat_saisie.clear();
                        description_saisie.clear();
                        montant_saisie.clear();
                        provider.affiche_false();
                        _speak("Vente à crédit enregistré avec succès");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "La vente à crédit a été enregistré avec succès dans la base de données",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.black87,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    } catch (e) {
                      provider.affiche_false();
                      _speak("une erreur s'est produite");
                      final snakbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "une erreur s'est produite",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        backgroundColor: Colors.redAccent.withOpacity(.8),
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                    }
                  },
                  child: affiche
                      ? CircularProgressIndicator(
                          color: Colors.black87,
                        )
                      : Text(
                          "Enregistrer le crédit".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        )),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts flutterTts = FlutterTts();
  flutterTts.setLanguage("Fr");
  flutterTts.setSpeechRate(0.5);
  flutterTts.setVolume(0.5);
  flutterTts.setPitch(1.0);
  flutterTts.speak(text);
}
