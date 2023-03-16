// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_local_variable, unused_field, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/poussins.dart';
import 'package:deogracias/provider/provider_achat_poussin.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AchatPoussin extends StatefulWidget {
  AchatPoussin({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  State<AchatPoussin> createState() => _AchatPoussinState();
}

class _AchatPoussinState extends State<AchatPoussin> {
  bool affiche = false;
  bool reduire = false;
  String _origine = "";
  String _nombre = "";
  String _prix_unitaire = "";
  String _montant = "";
  int _nombre_saisi = 0;
  int _prix_uniatire_saisi = 0;
  int _montant_saisi = 0;
  int total = 0;

  TextEditingController origine = TextEditingController();

  TextEditingController nombre = TextEditingController();

  TextEditingController prix_unitaire = TextEditingController();

  TextEditingController montant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final poussin = Provider.of<PoussinsUnJour>(context);
    final provider = Provider.of<ProviderAchatPoussin>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<Budget>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);

    affiche = provider.affiche;
    reduire = provider.reduire;
    _origine = provider.origine;
    _nombre = provider.nombre;
    _prix_unitaire = provider.prix_unitaire;
    _montant = provider.montant;
    _montant_saisi = _montant.isNotEmpty ? int.parse(_montant) : 0;
    _nombre_saisi = _nombre.isNotEmpty ? int.parse(_nombre) : 0;
    _prix_uniatire_saisi =
        _prix_unitaire.isNotEmpty ? int.parse(_prix_unitaire) : 0;
    total = _nombre_saisi * _prix_uniatire_saisi;
    return Scaffold(
      drawer: DrawerVagueAdmin(vague_uid: widget.vague_uid),
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
        centerTitle: false,
        title: Text(
          "Achat de poussin",
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
                    "Achat de ".toUpperCase() + poussin.nom.toUpperCase(),
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
                    "Quelle est la provenance de ces poussins ? ",
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
                  _speak(
                      "Le lieu de provenance de ces poussins s'il vous plait ");
                },
                controller: origine,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: _origine.isEmpty
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_origine(value, origine);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nombre de poussins achétés",
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prix uniatire d'achat",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: TextField(
                controller: prix_unitaire,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: _prix_unitaire.isEmpty
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_prix_unitaire(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Y- a t-il une réduction pour l'achat que vous voulez effectuer ? ",
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
                    "oui".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: true,
                  groupValue: reduire,
                  onChanged: (value) {
                    provider.change_reduire(value!);
                  },
                ),
                RadioListTile(
                  title: Text(
                    "non".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  groupValue: reduire,
                  onChanged: (value) {
                    provider.change_reduire(value!);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            reduire
                ? Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 12),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Le montant total pour cet achat que vous etes en train d'effectuer vaut " +
                                  total.toString() +
                                  " XOF\n\n Quel est le montant total avec réduction ?",
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
                      total = reduire && montant.text.isNotEmpty
                          ? int.parse(montant.text)
                          : total;
                      if (origine.text.isEmpty ||
                          nombre.text.isEmpty ||
                          prix_unitaire.text.isEmpty) {
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
                      } else if (reduire && montant.text.isEmpty) {
                        provider.affiche_false();
                        _speak(
                            "Vous devez saisir le montant total d'achat avec réduction");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez saisir le montant total en réduction",
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
                          "depense": budget.depense + total,
                        });

                        await FirebaseFirestore.instance
                            .collection("vagues")
                            .doc(widget.vague_uid)
                            .collection("budget")
                            .doc(budget_tiers.uid)
                            .update({"depense": budget_tiers.depense + total});

                        await FirebaseFirestore.instance
                            .collection("vagues")
                            .doc(widget.vague_uid)
                            .collection("poussins")
                            .doc(poussin.uid)
                            .update({
                          "user_uid": user.uid,
                          "updated_at": DateTime.now(),
                          "nombre_initial":
                              poussin.nombre_initial + _nombre_saisi,
                          "nombre_bon_etat":
                              poussin.nombre_bon_etat + _nombre_saisi,
                          "total_achat": poussin.total_achat + total
                        });

                        await FirebaseFirestore.instance
                            .collection("vagues")
                            .doc(widget.vague_uid)
                            .collection("achat_poussins")
                            .add({
                          "created_at": DateTime.now(),
                          "poussin_uid": poussin.uid,
                          "user_uid": user.uid,
                          "origine": _origine,
                          "nombre": _nombre_saisi,
                          "prix_unitaire": _prix_uniatire_saisi,
                          "montant": total
                        });

                        origine.clear();
                        nombre.clear();
                        prix_unitaire.clear();
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
                          "Enregistrer l'achat".toUpperCase(),
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
