// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/provider/provider_nouvelle_vague.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class NouvelleVague extends StatefulWidget {
  const NouvelleVague({super.key});

  @override
  State<NouvelleVague> createState() => _NouvelleVagueState();
}

class _NouvelleVagueState extends State<NouvelleVague> {
  TextEditingController nom_vague = TextEditingController();

  TextEditingController description_vague = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderNouvelleVague>(context);
    String nom = provider.nom;
    String description = provider.description;
    String vague_uid = "";
    bool affiche = provider.affiche;
    return Scaffold(
      drawer: DrawerAdmin(),
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
        centerTitle: true,
        title: Text(
          "Nouvelle vague",
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
                        "images/image8.jfif",
                      ),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Nouvelle vague",
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
                    "Nom de la vague svp",
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
                  _speak("Nom de la vague");
                },
                controller: nom_vague,
                autocorrect: true,
                maxLength: 80,
                enableSuggestions: true,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide: nom.isEmpty || nom.length < 3
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_nom(value, nom_vague);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description de la vague svp",
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
                  _speak("Description de la vague");
                },
                controller: description_vague,
                autocorrect: true,
                maxLines: 5,
                enableSuggestions: true,
                decoration: InputDecoration(
                    counterText: "",
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
                  provider.change_description(value);
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.93,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade900),
                  onPressed: () async {
                    try {
                      provider.affiche_true();
                      if (nom_vague.text.isEmpty ||
                          description_vague.text.isEmpty) {
                        provider.affiche_false();
                        _speak("Tous les champs sont obligatoires");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tous les champs sont recquis",
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
                        final result = await FirebaseFirestore.instance
                            .collection("vagues")
                            .where("nom", isEqualTo: nom_vague.text)
                            .get();

                        final is_empty = result.docs.isEmpty;

                        if (!is_empty) {
                          provider.affiche_false();
                          _speak("Cette vague existe dèjà");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Cette vague existe dèjà",
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
                          _speak("Création de la vague en cours");

                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .add({
                            "nom": nom_vague.text,
                            "description": description_vague.text,
                            "cloture": false,
                            "created_at": DateTime.now(),
                            "updated_at": DateTime.now(),
                            "user_uid": user.uid
                          });
                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .where("nom", isEqualTo: nom_vague.text)
                              .get()
                              .then((value) {
                            final vague = value.docs.first;
                            vague_uid = vague.id;
                          });

                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("budget")
                              .doc('budget_tiers')
                              .set({
                            "created_at": DateTime.now(),
                            "solde_total": 0,
                            "depense": 0,
                            "perte": 0,
                          });

                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("poussins")
                              .doc("poussin")
                              .set({
                            "created_at": DateTime.now(),
                            "updated_at": DateTime.now(),
                            "nom": "Poussin d'un jour",
                            "nombre_initial": 0,
                            "nombre_bon_etat": 0,
                            "nombre_malade": 0,
                            "nombre_mort": 0,
                            "total_achat": 0,
                            "user_uid": user.uid
                          });

                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("oeuf_tables")
                              .doc("oeuf_de_table")
                              .set({
                            "created_at": DateTime.now(),
                            "updated_at": DateTime.now(),
                            "user_uid": user.uid,
                            "montant_vendu": 0,
                            "nom": "oeuf de table",
                            "nombre_casse": 0,
                            "nombre_initial": 0,
                            "nombre_restant": 0,
                            "prix_unitaire": 100,
                            "prix_unitaire_plateaux": 2500,
                          });

                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("fientes")
                              .add({
                            "created_at": DateTime.now(),
                            "upsdated_at": DateTime.now(),
                            "user_uid": user.uid,
                            "montant_vendu": 0,
                            "nom": "Fiente en pétit sack",
                            "nombre_initial": 0,
                            "nombre_restant": 0,
                            "prix_unitaire": 2500,
                            "type_sack": "Pétit sack"
                          });
                          await FirebaseFirestore.instance
                              .collection("vagues")
                              .doc(vague_uid)
                              .collection("fientes")
                              .add({
                            "created_at": DateTime.now(),
                            "upsdated_at": DateTime.now(),
                            "user_uid": user.uid,
                            "montant_vendu": 0,
                            "nom": "Fiente en grand sack",
                            "nombre_initial": 0,
                            "nombre_restant": 0,
                            "prix_unitaire": 5000,
                            "type_sack": "Grand sack sack"
                          });
                          nom_vague.clear();
                          description_vague.clear();
                          _speak("Cette vague a été créé avec succès");
                          provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "La vague a été créé avec succès",
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
                      }
                    } catch (e) {
                      // print(e);
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
                          color: Colors.white,
                        )
                      : Text(
                          "Ajouter cette vague".toUpperCase(),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
