// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_local_variable, unused_field, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_user.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/provider/provider_signaler_bete_mort_retablie.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignalerBeteMortRetablieUser extends StatefulWidget {
  SignalerBeteMortRetablieUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  State<SignalerBeteMortRetablieUser> createState() =>
      _SignalerBeteMortRetablieUserState();
}

class _SignalerBeteMortRetablieUserState
    extends State<SignalerBeteMortRetablieUser> {
  bool affiche = false;

  bool mort = false;

  String _description = "";

  String _nombre = "";

  String _montant = "";

  int _nombre_saisi = 0;

  int _montant_saisi = 0;

  TextEditingController description = TextEditingController();

  TextEditingController nombre = TextEditingController();

  TextEditingController montant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bete = Provider.of<Betes>(context);
    final provider = Provider.of<ProviderSignalerBeteMortRetablie>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<Budget>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);
    affiche = provider.affiche;
    mort = provider.mort;
    _description = provider.description;
    _nombre = provider.nombre;
    _montant = provider.montant;
    _montant_saisi = _montant.isNotEmpty ? int.parse(_montant) : 0;
    _nombre_saisi = _nombre.isNotEmpty ? int.parse(_nombre) : 0;

    return Scaffold(
      drawer: DrawerUser(),
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
          bete.nom,
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
                    "Signaler un problème au niveau du ".toUpperCase() +
                        bete.nom.toUpperCase(),
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
                    "Nombre de " + bete.nom,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: nombre,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: _nombre.isEmpty
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ces " + bete.nom + " sont ils rétablies ou mortes ? ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text(
                    "Oui, elles sont rétablies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: true,
                  groupValue: mort,
                  onChanged: (value) {
                    provider.change_mort(value!);
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Non, elles sont finalement mortes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  groupValue: mort,
                  onChanged: (value) {
                    provider.change_mort(value!);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            !mort
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 12),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Décrivez la cause du décès ",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: description,
                          autocorrect: true,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: _description.isEmpty
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
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 12),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Quel est le montant en estimation pour l'achat de ces " +
                                  _nombre_saisi.toString() +
                                  " " +
                                  bete.nom +
                                  " ?",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: montant,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: _montant.isEmpty
                                      ? BorderSide(color: Colors.red)
                                      : BorderSide(color: Colors.blue)),
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          onChanged: (value) {
                            provider.change_montant(value);
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.93,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () async {
                    try {
                      provider.affiche_true();

                      if (nombre.text.isEmpty) {
                        provider.affiche_false();
                        _speak("Vous devez renseigner tous les champs");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez saisir tous les champs ",
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
                        if (mort) {
                          if (bete.nombre_malade < _nombre_saisi) {
                            provider.affiche_false();
                            _speak(
                                "Nombre insuffisant. Le nombre saisi est strictement supérieur au nombre malade de cette bete signalé. Il y a que " +
                                    bete.nombre_malade.toString() +
                                    " " +
                                    bete.nom +
                                    " malades");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Nombre isnuffisant. Le nombre saisi est strictement supérieur au nombre malades de " +
                                      bete.nom +
                                      " signalés",
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
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("betes")
                                .doc(bete.uid)
                                .update({
                              "updated_at": DateTime.now(),
                              "nombre_malade":
                                  bete.nombre_malade - _nombre_saisi
                            });

                            description.clear();
                            nombre.clear();

                            montant.clear();
                            provider.affiche_false();
                            _speak("Opération effectuée avec succès");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Successfully saved in data base . Thank you !",
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
                        } else {
                          if (!mort &&
                              (montant.text.isEmpty ||
                                  description.text.isEmpty)) {
                            provider.affiche_false();
                            _speak("Vous devez saisir le montant total en estimation de ces " +
                                _nombre_saisi.toString() +
                                "" +
                                bete.nom +
                                " et aussi faire une description de la cause du décès de ces poussins");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous devez saisir le montant total en estimation de ces " +
                                      _nombre_saisi.toString() +
                                      " " +
                                      bete.nom +
                                      " et aussi faire une description de la cause de leur décès",
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
                          } else if (_nombre_saisi > bete.nombre_malade) {
                            provider.affiche_false();
                            _speak(
                                "Nombre insuffisant. Le nombre saisi est strictement supérieur au nombre malade de " +
                                    bete.nom +
                                    " signalé. Il y a que " +
                                    bete.nombre_malade.toString() +
                                    " " +
                                    bete.nom +
                                    " malades");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Nombre isnuffisant. Le nombre saisi est strictement supérieur au nombre malades de " +
                                      bete.nom +
                                      " signalés",
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
                                .collection("budget")
                                .doc(budget.uid)
                                .update({
                              "perte": budget.perte + _montant_saisi,
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("budget")
                                .doc(budget_tiers.uid)
                                .update({
                              "perte": budget_tiers.perte + _montant_saisi
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("betes")
                                .doc(bete.uid)
                                .update({
                              "updated_at": DateTime.now(),
                              "nombre_restant":
                                  bete.nombre_restant - _nombre_saisi,
                              "nombre_mort": bete.nombre_mort + _nombre_saisi
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("pertes")
                                .add({
                              "created_at": DateTime.now(),
                              "user_uid": user.uid,
                              "description": _description,
                              "montant": _montant_saisi
                            });

                            description.clear();
                            nombre.clear();

                            montant.clear();
                            provider.affiche_false();
                            _speak("Opération effectuée avec succès");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Successfully saved in data base . Thank you !",
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
                      : !mort
                          ? Text(
                              "Enregistrer comme une perte".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Signaler la bete".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )),
            ),
            SizedBox(
              height: 50,
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
