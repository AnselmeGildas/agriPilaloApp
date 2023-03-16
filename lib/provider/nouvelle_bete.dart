// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, unused_field, must_be_immutable, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/provider/provider_nouvelle_bete.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NouvelleBete extends StatelessWidget {
  NouvelleBete({super.key, required this.vague_uid});
  final String vague_uid;
  String nom = "";
  String nombre_initial = "";
  int _nombre_initial = 0;
  bool affiche = false;
  bool is_empty = true;
  int prix_unitaire = 0;
  String prix = "";
  TextEditingController _nom = TextEditingController();
  TextEditingController _nombre = TextEditingController();
  TextEditingController _prix = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderNouvelleBete>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    nom = provider.nom;
    nombre_initial = provider.nombre_initial;
    affiche = provider.affiche;
    prix = provider.prix;

    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerVagueAdmin(vague_uid: vague_uid),
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
          "New animal",
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
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black87,
                        width: 3)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Rassurez-vous de ne pas dupliquer le nom de la bete. Ce dernier doit etre unique"
                          .toUpperCase(),
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nom de l'animal ",
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
                    _speak("Nom de cette bete ");
                  },
                  controller: _nom,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
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
                      "Prix unitaire de vente de " +
                          nom +
                          " ( pas obligatoire )",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _prix,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: prix.isEmpty
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_prix(value);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nombre initial",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _nombre,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: nombre_initial.isEmpty
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_nombre(value);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                height: 48,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () async {
                      try {
                        provider.affiche_true();
                        _nombre_initial = nombre_initial.isNotEmpty
                            ? int.parse(nombre_initial)
                            : 0;
                        prix_unitaire =
                            _prix.text.isNotEmpty ? int.parse(_prix.text) : 0;
                        if (_nom.text.isEmpty ||
                            _nombre.text.isEmpty ||
                            _nombre_initial <= 0) {
                          provider.affiche_false();
                          _speak("Vous devez bien renseigner tous les champs");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vous devez bien renseigner tous les champs",
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
                              .collection("betes")
                              .where("nom", isEqualTo: nom)
                              .get();
                          is_empty = result.docs.isEmpty;
                          if (is_empty) {
                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(vague_uid)
                                .collection("betes")
                                .add({
                              "user_uid": user.uid,
                              'created_at': DateTime.now(),
                              "updated_at": DateTime.now(),
                              "nom": nom,
                              "nombre_initial": _nombre_initial,
                              "nombre_restant": _nombre_initial,
                              "montant_vendu": 0,
                              "nombre_mort": 0,
                              "nombre_malade": 0,
                              "prix_unitaire": prix_unitaire
                            });
                            _prix.clear();
                            _nom.clear();
                            _nombre.clear();
                            provider.affiche_false();
                            _speak("Ajouté avec succès");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Successfuly added in data base . Thank you !",
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
                          } else {
                            provider.affiche_false();
                            _speak("Ce nom existe déjà");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Ce nom existe déjà",
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
                            "Enregistrez".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )),
              ),
              SizedBox(
                height: 70,
              )
            ],
          )),
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
