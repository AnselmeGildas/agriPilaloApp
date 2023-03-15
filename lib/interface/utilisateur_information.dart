// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class UtilisateursInformation extends StatelessWidget {
  const UtilisateursInformation({super.key, required this.user_password});
  final String user_password;
  @override
  Widget build(BuildContext context) {
    final utilisateur = Provider.of<donnesUtilisateur>(context);
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerAdmin(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Agri Piyalo",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 40,
              )),
          SizedBox(
            width: 20,
          ),
          Image.asset(
            "images/icon2.jpg",
            height: 70,
            width: 70,
            scale: 4.5,
          )
        ],
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
              "Accorder de droits à l'utilisateurs",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 20),
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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 49,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade900),
                        onPressed: () {},
                        child: Text(
                          "Informations sur l'utilisateur".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Nom : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.nom,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Prénom : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.prenom,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sexe : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.sexe,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Date de naissance : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.date_naissance,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Adresse E-Mail : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.email,
                            softWrap: true,
                            maxLines: 2,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Contacts : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.telephone,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "A créé son compte le : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            utilisateur.date_inscription,
                            softWrap: true,
                            maxLines: 2,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Compte : ",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        utilisateur.is_active
                            ? Expanded(
                                child: Text(
                                  "Actif".toUpperCase(),
                                  style: GoogleFonts.alike(
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Expanded(
                                child: Text(
                                  "Non actif".toUpperCase(),
                                  style: GoogleFonts.alike(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        !utilisateur.is_active
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: ElevatedButton(
                                    onPressed: () {
                                      ActivationDeCompte(
                                          context,
                                          utilisateur.prenom,
                                          utilisateur.nom,
                                          utilisateur.uid,
                                          user_password);
                                    },
                                    child: Text(
                                      "Activer le compte".toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: ElevatedButton(
                                    onPressed: () {
                                      DesActivationDeCompte(
                                          context,
                                          utilisateur.prenom,
                                          utilisateur.nom,
                                          utilisateur.uid,
                                          user_password);
                                    },
                                    child: Text(
                                      "Désactiver le compte".toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent),
                              onPressed: () {
                                SuppressionCompte(
                                    context,
                                    utilisateur.prenom,
                                    utilisateur.nom,
                                    utilisateur.uid,
                                    user_password);
                              },
                              child: Text(
                                "Supprimer cet utilisateur".toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
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
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Future<void> SuppressionCompte(
    BuildContext context,
    String utilisateur_prenom,
    String utilisateur_nom,
    String utilisateur_uid,
    String user_passxord,
  ) async {
    TextEditingController mot_de_passe = TextEditingController();
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green.shade800,
          title: Text(
            "Suppression de compte",
            textAlign: TextAlign.center,
            style: GoogleFonts.alike(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Suppression du compte de " +
                      utilisateur_prenom +
                      " " +
                      utilisateur_nom,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Votre mot de passe",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: mot_de_passe,
                    obscureText: true,
                    obscuringCharacter: "*",
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          try {
                            if (mot_de_passe.text.isEmpty ||
                                mot_de_passe.text.length < 8) {
                              _speak(
                                  "Vous n'avez pas saisi le mot de passe ou le mot de passe n'est pas correcte.");
                            } else if (sha1
                                    .convert(
                                        utf8.encode(mot_de_passe.text.trim()))
                                    .toString() !=
                                user_passxord) {
                              _speak(
                                  "Mot de passe saisi ne correspond pas à votre mot de passe");
                            } else {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(utilisateur_uid)
                                  .update({"deleted": true});
                              _speak("Compte supprimée avec succès");
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            _speak("Une erreur s'est produite");
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Suppression du compte ".toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
        );
      },
    );
  }

  Future<void> ActivationDeCompte(
    BuildContext context,
    String utilisateur_prenom,
    String utilisateur_nom,
    String utilisateur_uid,
    String user_passxord,
  ) async {
    TextEditingController mot_de_passe = TextEditingController();
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green.shade800,
          title: Text(
            "Activation de compte",
            textAlign: TextAlign.center,
            style: GoogleFonts.alike(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Activation du compte de " +
                      utilisateur_prenom +
                      " " +
                      utilisateur_nom,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Votre mot de passe",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: mot_de_passe,
                    obscureText: true,
                    obscuringCharacter: "*",
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          try {
                            if (mot_de_passe.text.isEmpty ||
                                mot_de_passe.text.length < 8) {
                              _speak(
                                  "Vous n'avez pas saisi le mot de passe ou le mot de passe saisi est incorrecte.");
                            } else if (sha1
                                    .convert(
                                        utf8.encode(mot_de_passe.text.trim()))
                                    .toString() !=
                                user_passxord) {
                              _speak(
                                  "Mot de passe saisi ne correspond pas à votre mot de passe");
                            } else {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(utilisateur_uid)
                                  .update({"is_active": true});
                              _speak("Compte supprimée avec succès");
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            _speak("Une erreur s'est produite");
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Activation du compte ".toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
        );
      },
    );
  }

  Future<void> DesActivationDeCompte(
    BuildContext context,
    String utilisateur_prenom,
    String utilisateur_nom,
    String utilisateur_uid,
    String user_passxord,
  ) async {
    TextEditingController mot_de_passe = TextEditingController();
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green.shade800,
          title: Text(
            "Désactivation de compte",
            textAlign: TextAlign.center,
            style: GoogleFonts.alike(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Désactivation du compte de " +
                      utilisateur_prenom +
                      " " +
                      utilisateur_nom,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Votre mot de passe",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: mot_de_passe,
                    obscureText: true,
                    obscuringCharacter: "*",
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          try {
                            if (mot_de_passe.text.isEmpty ||
                                mot_de_passe.text.length < 8) {
                              _speak(
                                  "Vous n'avez pas saisi le mot de passe ou le mot de passe saisi est incorrecte");
                            } else if (sha1
                                    .convert(
                                        utf8.encode(mot_de_passe.text.trim()))
                                    .toString() !=
                                user_passxord) {
                              _speak(
                                  "Mot de passe saisi ne correspond pas à votre mot de passe");
                            } else {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(utilisateur_uid)
                                  .update({"is_active": false});
                              _speak("Compte supprimée avec succès");
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            _speak("Une erreur s'est produite");
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Désactivation du compte ".toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
        );
      },
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
