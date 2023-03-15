// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, use_build_context_synchronously, non_constant_identifier_names, unused_element, unnecessary_string_interpolations, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/modele/services.dart';
import 'package:deogracias/services/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../provider/provider_service.dart';
import 'drawer_admin.dart';
import 'list_services.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderService>(context);
    final service = Provider.of<Services>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    return Scaffold(
      drawer: DrawerAdmin(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                EditService(context, service.nom, service.uid, service.titre,
                    service.photo, service.description, provider);
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                _DeleteService(context, service.nom, service.uid);
              },
              icon: Icon(Icons.delete)),
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
          "service",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              service.nom,
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 27),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                service.titre,
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            service.photo.isNotEmpty
                ? Image.network(
                    service.photo,
                    scale: 4.5,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Créé par " +
                    user.prenom +
                    " " +
                    user.nom +
                    " le " +
                    service.created_at +
                    " à " +
                    service.cretad_at_heure,
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                service.description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Future<void> EditService(
      BuildContext context,
      String service_non,
      String service_uid,
      String service_title,
      String service_photo,
      String service_description,
      ProviderService provider) async {
    TextEditingController nom_du_service = TextEditingController();
    TextEditingController titre_du_service = TextEditingController();
    TextEditingController description_du_service = TextEditingController();
    TextEditingController photo_du_service = TextEditingController();
    nom_du_service.text = service_non;
    titre_du_service.text = service_title;
    description_du_service.text = service_description;
    photo_du_service.text = provider.photo_url;
    File image;
    final _image_picker = ImagePicker();
    bool affiche = false;
    bool file_affiche = false;
    affiche = provider.affiche;
    file_affiche = provider.file_affiche;

    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green.shade800,
          title: Text(
            "Mise à jour",
            textAlign: TextAlign.center,
            style: GoogleFonts.alike(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListBody(
              children: [
                Text(
                  "Mettre à jour les informations du service " + service_non,
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
                    "Nom du service",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: nom_du_service,
                    enableSuggestions: true,
                    autocorrect: true,
                    maxLength: 80,
                    decoration: InputDecoration(
                        counterText: "",
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
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Titre du service",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: titre_du_service,
                    enableSuggestions: true,
                    autocorrect: true,
                    maxLength: 100,
                    decoration: InputDecoration(
                        counterText: "",
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
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Description du service",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: description_du_service,
                    enableSuggestions: true,
                    maxLines: 10,
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
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Fichier",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    enabled: false,
                    controller: photo_du_service,
                    enableSuggestions: true,
                    autocorrect: true,
                    maxLength: 80,
                    decoration: InputDecoration(
                        counterText: "",
                        hintStyle: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          try {
                            _speak("Veuillez patienter");
                            provider.file_affiche_true();
                            final image = await _image_picker.pickImage(
                                source: ImageSource.gallery,
                                maxHeight: 512,
                                maxWidth: 512);
                            String file_name = basename(image!.path);

                            final ref = FirebaseStorage.instance
                                .ref()
                                .child('$file_name');
                            await ref.putFile(File(image.path));
                            ref.getDownloadURL().then((value) {
                              provider.change_photo_url(value);
                            });
                            _speak("photo récupéré avec succès");
                            provider.file_affiche_false();
                          } catch (e) {
                            provider.file_affiche_false();
                            _speak(
                                "Une erreur s'est produite. Vérifier votre connection internet");
                          }
                        },
                        child: file_affiche
                            ? CircularProgressIndicator(
                                color: Colors.black87,
                              )
                            : Text(
                                "Joindre une photo".toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87),
                        onPressed: () async {
                          try {
                            provider.affiche_true();
                            photo_du_service.text.isEmpty
                                ? photo_du_service.text = service_photo
                                : photo_du_service.text;
                            if (nom_du_service.text.isEmpty ||
                                titre_du_service.text.isEmpty ||
                                description_du_service.text.isEmpty ||
                                photo_du_service.text.isEmpty) {
                              _speak("Vous devez renseigner tous les champs");
                              provider.affiche_false();
                            } else if (nom_du_service.text == service_non) {
                              await FirebaseFirestore.instance
                                  .collection("services")
                                  .doc(service_uid)
                                  .update({
                                "titre": titre_du_service.text,
                                "description": description_du_service.text,
                                "photo_url": photo_du_service.text,
                                "updated_at": DateTime.now()
                              });
                              _speak("Mise à jour effectué avec succès");
                              provider.affiche_false();
                              Navigator.of(context).pop();
                            } else {
                              final result = await FirebaseFirestore.instance
                                  .collection("services")
                                  .where("nom", isEqualTo: nom_du_service.text)
                                  .get();
                              final is_empty = result.docs.isEmpty;

                              if (!is_empty) {
                                provider.affiche_false();
                                _speak("Ce nom existe déjà");
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("services")
                                    .doc(service_uid)
                                    .update({
                                  "titre": titre_du_service.text,
                                  "description": description_du_service.text,
                                  "photo_url": photo_du_service.text,
                                  "updated_at": DateTime.now(),
                                  "nom": nom_du_service.text,
                                });
                                _speak("Mise à jour effectué avec succès");
                                provider.affiche_false();
                                Navigator.of(context).pop();
                              }
                            }
                          } catch (e) {
                            _speak("Une erreur s'est produite");
                            provider.affiche_false();
                            Navigator.of(context).pop();
                          }
                        },
                        child: affiche
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Mise à jour".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _DeleteService(
      BuildContext context, String service_nom, String service_uid) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Suppression".toUpperCase()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Vous etes sur le point de supprimer  " +
                    service_nom +
                    " de la base de données de cette entreprise"),
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
                              .collection("services")
                              .doc(service_uid)
                              .delete();

                          _speak("Suppression effectué avec succès");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListServices(),
                              ));
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
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        _speak("Suppression du service annulée");
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
      },
    );
  }

  Future _speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage("Fr");
    flutterTts.setSpeechRate(0.5);
    flutterTts.setVolume(0.5);
    flutterTts.setPitch(1.0);
    flutterTts.speak(text);
  }
}
