// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unused_local_variable, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockDuFiente extends StatelessWidget {
  const StockDuFiente({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    final fiente = Provider.of<Fientes>(context);
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerVagueAdmin(vague_uid: vague_uid),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                EditFiente(
                    context,
                    fiente.nom,
                    fiente.uid,
                    fiente.nombre_restant,
                    fiente.nombre_initial,
                    fiente.prix_unitaire,
                    vague_uid);
              },
              icon: Icon(Icons.edit)),
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 70,
            width: 70,
          ),
        ],
        elevation: 0,
        centerTitle: false,
        title: Text(
          fiente.nom,
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
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Stock de " + fiente.nom,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
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
                height: 14,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue.shade800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Disponibilité du fiente ".toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.vertical_align_bottom,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Nombre initial",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fiente.nombre_initial.toString(),
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Nombre vendu",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (fiente.nombre_initial - fiente.nombre_restant)
                              .toString(),
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Nombre restant",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fiente.nombre_restant.toString(),
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Prix unitaire",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fiente.prix_unitaire.toString() + " XOF",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue.shade800),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total de vente",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            fiente.montant_vendu.toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Future<void> EditFiente(
      BuildContext context,
      String fiente_non,
      String fiente_uid,
      int nombre_restant,
      int nombre_initial,
      int prix_unitaire,
      String vague_uid) async {
    TextEditingController nom = TextEditingController();
    TextEditingController nombre = TextEditingController();
    TextEditingController prix_unitaire = TextEditingController();
    int _nombre = 0;
    int difference = 0;
    int _prix_unitaire = 0;
    prix_unitaire.text = prix_unitaire.toString();
    nom.text = fiente_non;
    nombre.text = nombre_restant.toString();
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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Mettre à jour les informations rélative au " + fiente_non,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Nom",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: nom,
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
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Nombre restant",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 30),
                  child: TextField(
                    controller: nombre,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Prix unitaire",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: TextField(
                    controller: prix_unitaire,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                  ),
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
                            _nombre = nombre.text.isNotEmpty
                                ? int.parse(nombre.text)
                                : 0;
                            _prix_unitaire = prix_unitaire.text.isNotEmpty
                                ? int.parse(prix_unitaire.text)
                                : 0;
                            if (nom.text.isEmpty ||
                                nombre.text.isEmpty ||
                                prix_unitaire.text.isEmpty) {
                              _speak("Vous devez renseigner tous les champs");
                            } else {
                              if (nom == fiente_non) {
                                difference = nombre_restant > _nombre
                                    ? nombre_restant - _nombre
                                    : _nombre - nombre_restant;

                                if (nombre_restant > _nombre) {
                                  await FirebaseFirestore.instance
                                      .collection("vagues")
                                      .doc(vague_uid)
                                      .collection("fientes")
                                      .doc(fiente_uid)
                                      .update({
                                    "nom": nom.text,
                                    "nombre_restant": _nombre,
                                    "nombre_initial":
                                        nombre_initial - difference,
                                    "prix_unitaire": _prix_unitaire,
                                    "updated_at": DateTime.now()
                                  });
                                } else {
                                  await FirebaseFirestore.instance
                                      .collection("vagues")
                                      .doc(vague_uid)
                                      .collection("fientes")
                                      .doc(fiente_uid)
                                      .update({
                                    "prix_unitaire": _prix_unitaire,
                                    "nom": nom.text,
                                    "nombre_restant": _nombre,
                                    "nombre_initial":
                                        nombre_initial + difference,
                                    "updated_at": DateTime.now()
                                  });
                                }
                                _speak("Mise à jour effectué avec succès");
                              } else {
                                final result = await FirebaseFirestore.instance
                                    .collection("vagues")
                                    .doc(vague_uid)
                                    .collection("fientes")
                                    .where("nom", isEqualTo: nom)
                                    .get();
                                final is_empty = result.docs.isEmpty;

                                if (is_empty) {
                                  difference = nombre_restant > _nombre
                                      ? nombre_restant - _nombre
                                      : _nombre - nombre_restant;

                                  if (nombre_restant > _nombre) {
                                    await FirebaseFirestore.instance
                                        .collection("vagues")
                                        .doc(vague_uid)
                                        .collection("fientes")
                                        .doc(fiente_uid)
                                        .update({
                                      "prix_unitaire": _prix_unitaire,
                                      "nom": nom.text,
                                      "nombre_restant": _nombre,
                                      "nombre_initial":
                                          nombre_initial - difference,
                                      "updated_at": DateTime.now()
                                    });
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection("vagues")
                                        .doc(vague_uid)
                                        .collection("fientes")
                                        .doc(fiente_uid)
                                        .update({
                                      "prix_unitaire": _prix_unitaire,
                                      "nom": nom.text,
                                      "nombre_restant": _nombre,
                                      "nombre_initial":
                                          nombre_initial + difference,
                                      "updated_at": DateTime.now()
                                    });
                                  }
                                  _speak("Mise à jour effectué avec succès");
                                } else {
                                  _speak("le nom saisi existe déjà");
                                }
                              }

                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            _speak("Une erreur s'est produite");
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          "Mise à jour".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.black87,
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
