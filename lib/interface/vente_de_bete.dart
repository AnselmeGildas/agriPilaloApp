// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors_in_immutables, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/provider/provider_vente_bete.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenteDeBete extends StatefulWidget {
  VenteDeBete({
    super.key,
    required this.vague_uid,
  });
  final String vague_uid;
  @override
  State<VenteDeBete> createState() => _VenteDeBeteState();
}

class _VenteDeBeteState extends State<VenteDeBete> {
  String nombre = "";

  String montant_total = "";

  bool affiche = false;

  int _nombre = 0;

  int _montant = 0;
  int _montant_en_reduction = 0;
  String montant_reduit = "";
  bool reduire = false;

  TextEditingController nombre_vendu = TextEditingController();

  TextEditingController prix_total = TextEditingController();

  TextEditingController montant_en_reduction = TextEditingController();
  int number1 = 0;

  int total = 0;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final bete = Provider.of<Betes>(context);
    final provider = Provider.of<ProviderVenteBete>(context);
    final budget = Provider.of<Budget>(context);
    final budget_tiers = Provider.of<BudgetTiers>(context);
    reduire = provider.reduire;
    montant_reduit = provider.montant_reduit;
    nombre = provider.nombre;
    montant_total = provider.montant_total;
    number1 = provider.nombre.isNotEmpty ? int.parse(provider.nombre) : 0;
    total = number1 * bete.prix_unitaire;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerVagueAdmin(vague_uid: widget.vague_uid),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
          bete.nom,
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
              Text(
                "Vente de betes",
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
                height: 44,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    "Vous disposez de " +
                        bete.nombre_restant.toString() +
                        " unités de " +
                        bete.nom +
                        " en stock de votre entreprise.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19)),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Quel nombre de " + bete.nom + " voulez vous vendre ?",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: TextField(
                  controller: nombre_vendu,
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
              bete.prix_unitaire <= 0
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 12),
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Montant total de vente",
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 25),
                          child: TextField(
                            controller: prix_total,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: montant_total.isEmpty
                                        ? BorderSide(color: Colors.red)
                                        : BorderSide(color: Colors.blue)),
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true),
                            onChanged: (value) {
                              provider.change_montant_total(value);
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 0),
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Voulez vous appliquer une réduction pour cette vente ?",
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
                              groupValue: reduire,
                              onChanged: (value) {
                                provider.change_reduire(value);
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
                              groupValue: reduire,
                              onChanged: (value) {
                                provider.change_reduire(value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        reduire
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 12),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Le montant normal total de vente en fonction du prix unitaire et du nombre d'unité d'oeufs de tables que vous avez saisi est de " +
                                              total.toString() +
                                              " XOF.\n\nMontant total avec réduction",
                                          style: GoogleFonts.alike(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 25),
                                    child: TextField(
                                      controller: montant_en_reduction,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: montant_reduit.isEmpty
                                                  ? BorderSide(
                                                      color: Colors.red)
                                                  : BorderSide(
                                                      color: Colors.blue)),
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true),
                                      onChanged: (value) {
                                        provider.change_montant_reduit(value);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
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
                        _montant = prix_total.text.isNotEmpty
                            ? int.parse(prix_total.text)
                            : 0;
                        _montant_en_reduction =
                            montant_en_reduction.text.isNotEmpty
                                ? int.parse(montant_en_reduction.text)
                                : 0;
                        _nombre = nombre.isNotEmpty ? int.parse(nombre) : 0;
                        if (nombre_vendu.text.isEmpty || _nombre <= 0) {
                          _speak("Vous devez renseigner le nombre de " +
                              bete.nom +
                              " que vous voudriez vendre");
                          provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vous devez bien renseigner le nombre de " +
                                    bete.nom +
                                    " que vous voudriez vendre",
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
                        } else if (_nombre > bete.nombre_restant) {
                          _speak("Nombre insuffisant");
                          provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Stock insuffisant !",
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
                        } else if (bete.prix_unitaire == 0) {
                          if (prix_total.text.isEmpty) {
                            _speak("Vous devez saisir le montant total de vente de " +
                                _montant.toString() +
                                " " +
                                bete.nom +
                                " puisque le prix unitaire de vente n'a pas été prédefini");
                            provider.affiche_false();

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous devez saisir le montant total de vente de ces " +
                                      _nombre.toString() +
                                      " " +
                                      bete.nom +
                                      " puisque le prix unitaire de vente n'a pas été prédefini",
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
                              "solde_total": budget.solde_total + _montant
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("budget")
                                .doc(budget_tiers.uid)
                                .update({
                              "solde_total": budget_tiers.solde_total + _montant
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("vente_betes")
                                .add({
                              "created_at": DateTime.now(),
                              "user_uid": user.uid,
                              "bete_uid": bete.uid,
                              "nombre": _nombre,
                              "montant": _montant,
                              "updated": false,
                              "updated_at": DateTime.now(),
                              "bete_nom": bete.nom
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("betes")
                                .doc(bete.uid)
                                .update({
                              "nombre_restant": bete.nombre_restant - _nombre,
                              "montant_vendu": bete.montant_vendu + _montant,
                              "updated_at": DateTime.now(),
                            });

                            _speak("La vente a été enregistrée avec succès");
                            provider.affiche_false();
                            nombre_vendu.clear();
                            montant_en_reduction.clear();

                            prix_total.clear();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Successfully saved in data base. Thank tou",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.black,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          }
                        } else {
                          if (reduire) {
                            if (montant_en_reduction.text.isEmpty) {
                              _speak("Vous devez saisir le montant total en réduction de vente de " +
                                  _montant.toString() +
                                  " " +
                                  bete.nom +
                                  " puisque le prix unitaire de vente n'a pas été prédefini");
                              provider.affiche_false();

                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vous devez saisir le montant total en réduction de vente de ces " +
                                        _nombre.toString() +
                                        " " +
                                        bete.nom +
                                        " puisque le prix unitaire de vente n'a pas été prédefini",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.8),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            } else {
                              await FirebaseFirestore.instance
                                  .collection("budget")
                                  .doc(budget.uid)
                                  .update({
                                "solde_total":
                                    budget.solde_total + _montant_en_reduction
                              });
                              await FirebaseFirestore.instance
                                  .collection("vagues")
                                  .doc(widget.vague_uid)
                                  .collection("budget")
                                  .doc(budget_tiers.uid)
                                  .update({
                                "solde_total": budget_tiers.solde_total +
                                    _montant_en_reduction
                              });

                              await FirebaseFirestore.instance
                                  .collection("vagues")
                                  .doc(widget.vague_uid)
                                  .collection("vente_betes")
                                  .add({
                                "created_at": DateTime.now(),
                                "user_uid": user.uid,
                                "bete_uid": bete.uid,
                                "nombre": _nombre,
                                "montant": _montant_en_reduction,
                                "updated": false,
                                "updated_at": DateTime.now(),
                                "bete_nom": bete.nom
                              });

                              await FirebaseFirestore.instance
                                  .collection("vagues")
                                  .doc(widget.vague_uid)
                                  .collection("betes")
                                  .doc(bete.uid)
                                  .update({
                                "nombre_restant": bete.nombre_restant - _nombre,
                                "montant_vendu":
                                    bete.montant_vendu + _montant_en_reduction,
                                "updated_at": DateTime.now(),
                              });

                              _speak("La vente a été enregistrée avec succès");
                              provider.affiche_false();
                              nombre_vendu.clear();
                              prix_total.clear();
                              montant_en_reduction.clear();
                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Successfully saved in data base. Thank tou",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                backgroundColor: Colors.black,
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            }
                          } else {
                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(budget.uid)
                                .update({
                              "solde_total": budget.solde_total + total
                            });
                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("budget")
                                .doc(budget_tiers.uid)
                                .update({
                              "solde_total": budget_tiers.solde_total + total
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("vente_betes")
                                .add({
                              "created_at": DateTime.now(),
                              "user_uid": user.uid,
                              "bete_uid": bete.uid,
                              "nombre": _nombre,
                              "montant": total,
                              "updated": false,
                              "updated_at": DateTime.now(),
                              "bete_nom": bete.nom
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(widget.vague_uid)
                                .collection("betes")
                                .doc(bete.uid)
                                .update({
                              "nombre_restant": bete.nombre_restant - _nombre,
                              "montant_vendu": bete.montant_vendu + total,
                              "updated_at": DateTime.now(),
                            });

                            _speak("La vente a été enregistrée avec succès");
                            provider.affiche_false();
                            nombre_vendu.clear();
                            montant_en_reduction.clear();
                            prix_total.clear();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Successfully saved in data base. Thank tou",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.black,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          }
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
                            "Enregistrez".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
              ),
              SizedBox(
                height: 50,
              )
            ],
          )),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
