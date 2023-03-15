// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, use_build_context_synchronously, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_user.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/provider/provider_vente_oeuf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../modele/budget.dart';
import '../services/user.dart';

class VenteOeufTableUser extends StatefulWidget {
  VenteOeufTableUser({super.key});

  @override
  State<VenteOeufTableUser> createState() => _VenteOeufTableUserState();
}

class _VenteOeufTableUserState extends State<VenteOeufTableUser> {
  String nombre = "";

  String montant_total = "";

  int total1 = 0;

  int total = 0;

  bool affiche = false;

  bool reduire = false;
  bool vente_par_plateau = true;
  int _nombre = 0;

  int _montant = 0;

  TextEditingController nombre_vendu = TextEditingController();

  TextEditingController prix_total = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final oeuf = Provider.of<OeufTables>(context);
    final provider = Provider.of<ProviderVenteOeufTable>(context);
    final budget = Provider.of<Budget>(context);
    vente_par_plateau = provider.vente_par_plateau;
    reduire = provider.reduire;
    total1 = provider.nombre.isNotEmpty ? int.parse(provider.nombre) : 0;
    total = !vente_par_plateau
        ? total1 * oeuf.prix_unitaire
        : total * oeuf.prix_unitaire_plateaux;
    nombre = provider.nombre;
    montant_total = provider.montant_total;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerUser(),
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
            Text(
              "Vente d'oeuf de tables",
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Vous disposez de " +
                    oeuf.nombre_restant.toString() +
                    " unités de " +
                    oeuf.nom +
                    " en stock de votre entreprise.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Voulez vous éffectuer la vente par plateaux ?",
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
                    "oui, en plateaux".toUpperCase(),
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  value: true,
                  groupValue: vente_par_plateau,
                  onChanged: (value) {
                    provider.change_vente_par_plateau(value);
                  },
                ),
                RadioListTile(
                  title: Text(
                    "non, en unités".toUpperCase(),
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  groupValue: vente_par_plateau,
                  onChanged: (value) {
                    provider.change_vente_par_plateau(value);
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
                  child: !vente_par_plateau
                      ? Text(
                          "Quel nombre d' " +
                              oeuf.nom +
                              " voulez vous vendre ?",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "Quel nombre de plateau d'oeuf de table voulez vous vendre ? ",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
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
                        fontSize: 15,
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
                        fontSize: 15,
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
                        padding: const EdgeInsets.only(left: 15, bottom: 12),
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
                : Container(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.94,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade800),
                  onPressed: () async {
                    try {
                      provider.affiche_true();
                      _montant = montant_total.isNotEmpty
                          ? int.parse(montant_total)
                          : 0;

                      _nombre = nombre.isNotEmpty
                          ? !vente_par_plateau
                              ? int.parse(nombre_vendu.text)
                              : int.parse(nombre_vendu.text) * 30
                          : 0;
                      _montant > 0 ? total = _montant : total;
                      if (nombre_vendu.text.isEmpty ||
                          total <= 0 ||
                          _nombre <= 0) {
                        _speak("Vous devez renseigner bien tous les champs");
                        provider.affiche_false();

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez bien renseigner tous les champs !",
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
                      } else if (reduire && prix_total.text.isEmpty) {
                        _speak(
                            "Vous devez renseigner le prix total de vente en réduction. Veuillez vous inspirer du montant normal total pour appliquer la réduction");
                        provider.affiche_false();

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez renseigner le prix total de vente en réduction. Veuillez vous inspirer du montant normal total pour appliquer la réduction",
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
                      } else if (_nombre > oeuf.nombre_restant) {
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
                      } else {
                        await FirebaseFirestore.instance
                            .collection("budget")
                            .doc(budget.uid)
                            .update(
                                {"solde_total": budget.solde_total + total});

                        await FirebaseFirestore.instance
                            .collection("vente_oeuf_tables")
                            .add({
                          "created_at": DateTime.now(),
                          "user_uid": user.uid,
                          "oeuf_uid": oeuf.uid,
                          "nombre": _nombre,
                          "montant": total,
                          "updated": false,
                          "updated_at": DateTime.now(),
                          "unite": vente_par_plateau ? false : true,
                        });

                        await FirebaseFirestore.instance
                            .collection("oeuf_tables")
                            .doc(oeuf.uid)
                            .update({
                          "nombre_restant": oeuf.nombre_restant - _nombre,
                          "montant_vendu": oeuf.montant_vendu + total,
                          "updated_at": DateTime.now(),
                        });

                        _speak("La vente a été enregistrée avec succès");
                        provider.affiche_false();
                        nombre_vendu.clear();
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
                          color: Colors.white,
                        )
                      : Text(
                          "Enregistrez".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
