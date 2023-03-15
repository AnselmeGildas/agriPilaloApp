// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/provider/provider_service.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'drawer_admin.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NouveauServie extends StatefulWidget {
  const NouveauServie({super.key});

  @override
  State<NouveauServie> createState() => _NouveauServieState();
}

class _NouveauServieState extends State<NouveauServie> {
  TextEditingController nom_saisie = TextEditingController();

  TextEditingController titre_saisie = TextEditingController();

  TextEditingController description_saisie = TextEditingController();

  TextEditingController file = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderService>(context);
    String nom = "";
    String titre = "";
    String description = "";
    String photo_url = "";
    bool affiche = false;
    bool file_affiche = false;
    nom = provider.nom;
    titre = provider.titre;
    description = provider.description;
    photo_url = provider.photo_url;
    affiche = provider.affiche;
    file_affiche = provider.file_affiche;
    File _file;
    final _image_picker = ImagePicker();
    file.text = photo_url;
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
          "Nouvel service",
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
              "Nouvel service",
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
                    "Nom du service ",
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
                  _speak("Nom du service");
                },
                controller: nom_saisie,
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
                  provider.change_nom(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Donnez un titre à ce service ",
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
                  _speak("Titre du service de prestation ");
                },
                controller: titre_saisie,
                autocorrect: true,
                maxLength: 120,
                enableSuggestions: true,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide: titre.isEmpty || titre.length < 3
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_titre(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description détailée du service ",
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
                  _speak("Décrivez en détail le service. ");
                },
                controller: description_saisie,
                maxLines: 15,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            description.isEmpty || description.length < 3
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
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fichier ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                enabled: false,
                controller: file,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
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
                      provider.file_affiche_true();
                      final image = await _image_picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 512,
                          maxWidth: 512);
                      String file_name = basename(image!.path);

                      final ref =
                          FirebaseStorage.instance.ref().child('$file_name');
                      await ref.putFile(File(image.path));
                      ref.getDownloadURL().then((value) {
                        provider.change_photo_url(value);
                      });

                      provider.file_affiche_false();
                      _speak("Photo récupérer avec succès");
                      final snakbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "La photo a été récupérée avec succès",
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
                    } catch (e) {
                      provider.file_affiche_false();
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
                  child: file_affiche
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text(
                          "Joindre une photo".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
            ),
            SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.92,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade800),
                  onPressed: () async {
                    try {
                      provider.affiche_true();
                      if (nom_saisie.text.isEmpty ||
                          titre_saisie.text.isEmpty ||
                          description_saisie.text.isEmpty) {
                        provider.affiche_false();
                        _speak("Renseignez tous les champs");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Renseignez tous les champs",
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
                      } else if (file.text.isEmpty) {
                        provider.affiche_false();
                        _speak("Vous devez joindre une photo");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez joindre une photo",
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
                            .collection("services")
                            .where("nom", isEqualTo: nom_saisie.text)
                            .get();
                        final is_empty = result.docs.isEmpty;

                        if (!is_empty) {
                          provider.affiche_false();
                          _speak("Ce service existe déjà");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ce service existe déjà",
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
                              .collection("services")
                              .add({
                            'user_uid': user.uid,
                            'created_at': DateTime.now(),
                            'updated_at': DateTime.now(),
                            'nom': nom_saisie.text,
                            'titre': titre_saisie.text,
                            'description': description_saisie.text,
                            'photo_url': photo_url,
                          });
                          nom_saisie.clear();
                          titre_saisie.clear();
                          description_saisie.clear();
                          provider.change_photo_url("");
                          provider.affiche_false();
                          _speak(
                              "Enregistré avec succès dans la base de données");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Successfully saved in database . Thank tou",
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
                  child: Text(
                    "Enregistrer le service".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 70,
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
