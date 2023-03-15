// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, non_constant_identifier_names, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_admin.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/provider/provider_recharger_oeuf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockOeufs extends StatefulWidget {
  StockOeufs({super.key});

  @override
  State<StockOeufs> createState() => _StockOeufsState();
}

class _StockOeufsState extends State<StockOeufs> {
  String nombre = "";

  bool affiche = false;
  bool recharger_par_plateau = true;
  int _nombre_bete = 0;

  TextEditingController _nombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final oeuf = Provider.of<OeufTables>(context);
    final provider = Provider.of<ProviderRechargerOeufTables>(context);
    affiche = provider.affiche;
    nombre = provider.nombre;
    recharger_par_plateau = provider.recharger_par_plateau;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerAdmin(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 70,
            width: 70,
          ),
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          oeuf.nom,
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
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Réchargement du stock de " + oeuf.nom,
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
                height: 94,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Voulez vous faire le réchargement par unité de plateaux ?",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Column(
                children: [
                  RadioListTile(
                    title: Text(
                      "oui".toUpperCase(),
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    value: true,
                    groupValue: recharger_par_plateau,
                    onChanged: (value) {
                      provider.change_recharger_par_plateau(value);
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "non".toUpperCase(),
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    value: false,
                    groupValue: recharger_par_plateau,
                    onChanged: (value) {
                      provider.change_recharger_par_plateau(value);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: !recharger_par_plateau
                        ? Text(
                            "Quel nombre d'unités d' " +
                                oeuf.nom +
                                " voulez vous ajouter ?",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "Quel nombre de plateaux d'oeuf de tables voulez vous ajouter ?",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: TextField(
                  controller: _nombre,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: nombre.isEmpty
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
                width: MediaQuery.of(context).size.width * 0.94,
                height: 47,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () async {
                      try {
                        _nombre_bete = nombre.isNotEmpty
                            ? !recharger_par_plateau
                                ? int.parse(nombre)
                                : int.parse(nombre) * 30
                            : 0;
                        provider.affiche_true();

                        if (_nombre.text.isEmpty || _nombre_bete <= 0) {
                          _speak("Vous devez renseigner ce champ");
                          provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vous devez renseigner ce champ !",
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
                              .collection("oeuf_tables")
                              .doc(oeuf.uid)
                              .update({
                            "nombre_restant":
                                oeuf.nombre_restant + _nombre_bete,
                            'nombre_initial':
                                oeuf.nombre_initial + _nombre_bete,
                            "updated_at": DateTime.now()
                          });
                          _speak("Effectué avec succès");
                          provider.affiche_false();
                          _nombre.clear();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "This operation has succesfully done !",
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
                        _speak("Une erreur est survenue");
                        provider.affiche_false();

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur inattendue est survenue !",
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
                            color: Colors.black,
                          )
                        : Text(
                            "Ajouter".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )),
              ),
              SizedBox(
                height: 80,
              )
            ],
          )),
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
