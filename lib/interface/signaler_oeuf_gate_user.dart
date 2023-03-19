// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_local_variable, unused_field, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_user.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/provider/provider_signaler_oeuf_casse.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignalerOeufCasseUser extends StatefulWidget {
  SignalerOeufCasseUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  State<SignalerOeufCasseUser> createState() => _SignalerOeufCasseUserState();
}

class _SignalerOeufCasseUserState extends State<SignalerOeufCasseUser> {
  bool affiche = false;

  String _description = "";

  String _nombre = "";

  int _nombre_saisi = 0;

  int _montant = 0;

  TextEditingController description = TextEditingController();

  TextEditingController nombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Oeuf_tables = Provider.of<OeufTables>(context);
    final provider = Provider.of<ProviderSignalerOeufCasse>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<Budget>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);
    affiche = provider.affiche;
    _description = provider.description;
    _nombre = provider.nombre;
    bool par_plateau = provider.par_plateau;
    return Scaffold(
      drawer: DrawerUser(vague_uid: widget.vague_uid),
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
          Oeuf_tables.nom,
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
                    "Signaler un problème au niveau des ".toUpperCase() +
                        Oeuf_tables.nom.toUpperCase(),
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
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Voulez renseigner le nombre de poussins par plateaux ? ",
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
                    "Oui".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  value: true,
                  groupValue: par_plateau,
                  onChanged: (value) {
                    provider.change_par_plateau(value!);
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Non".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  groupValue: par_plateau,
                  onChanged: (value) {
                    provider.change_par_plateau(value!);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            !par_plateau
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 12, right: 5),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nombre de " + Oeuf_tables.nom + " cassés ou gatés",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 12, right: 5),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nombre de plateaux d'" +
                              Oeuf_tables.nom +
                              " cassés ou gatés",
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
              padding: const EdgeInsets.only(left: 15, bottom: 12, right: 5),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Décrivez la cause svp ",
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
                      _nombre_saisi =
                          nombre.text.isNotEmpty ? int.parse(nombre.text) : 0;
                      if (par_plateau) {
                        _nombre_saisi = _nombre_saisi * 30;
                      }
                      _montant = _nombre_saisi * Oeuf_tables.prix_unitaire;

                      if (nombre.text.isEmpty || description.text.isEmpty) {
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
                      } else if (_nombre_saisi > Oeuf_tables.nombre_restant) {
                        provider.affiche_false();
                        _speak(
                            "Nombre insuffisant. Le nombre saisi est strictement supérieur au nombre restant d'oeuf de table. Il ne reste que " +
                                Oeuf_tables.nombre_restant.toString());
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Nombre isnuffisant. Le nombre saisi est strictement supérieur au nombre restant de " +
                                  Oeuf_tables.nom,
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
                          "perte": budget.perte + _montant,
                        });

                        await FirebaseFirestore.instance
                            .collection("vagues")
                            .doc(widget.vague_uid)
                            .collection("budget")
                            .doc(budget_tiers.uid)
                            .update(
                                {"perte": budget_tiers.perte + _nombre_saisi});

                        await FirebaseFirestore.instance
                            .collection("vagues")
                            .doc(widget.vague_uid)
                            .collection("oeuf_tables")
                            .doc(Oeuf_tables.uid)
                            .update({
                          "updated_at": DateTime.now(),
                          "nombre_restant":
                              Oeuf_tables.nombre_restant - _nombre_saisi,
                          "nombre_casse":
                              Oeuf_tables.nombre_casse + _nombre_saisi
                        });

                        await FirebaseFirestore.instance
                            .collection("vagues")
                            .doc(widget.vague_uid)
                            .collection("pertes")
                            .add({
                          "created_at": DateTime.now(),
                          "user_uid": user.uid,
                          "description": _description,
                          "montant": _montant
                        });

                        description.clear();
                        nombre.clear();

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
                          "Enregistrer comme une perte".toUpperCase(),
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
