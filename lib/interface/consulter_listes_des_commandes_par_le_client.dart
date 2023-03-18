// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/interface/stream_des_commandes_du_client.dart';
import 'package:deogracias/provider/provider_recherche_commande_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListeDesCommandesDuClient extends StatefulWidget {
  const ListeDesCommandesDuClient({super.key});

  @override
  State<ListeDesCommandesDuClient> createState() =>
      _ListeDesCommandesDuClientState();
}

class _ListeDesCommandesDuClientState extends State<ListeDesCommandesDuClient> {
  @override
  void initState() {
    super.initState();
  }

  String email = "";
  bool affiche = false;

  String collection = "commandes";
  String clause = "email";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderRechercheCommandeClient>(context);

    email = provider.email;
    affiche = provider.affiche;

    return Scaffold(
        drawer: DrawerClient(),
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
            "Agri Pilalo",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
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
                "Commandes passées",
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 2,
                width: 80,
                color: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, bottom: 40),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.redAccent,
                            width: 2,
                            style: BorderStyle.solid)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Veuillez nous renseigner l'adresse mail utilisé pour enregistrer toutes vos commandes"
                            .toUpperCase(),
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.alike(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Votre adresse E-Mail svp !",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20),
                child: TextField(
                  autocorrect: true,
                  enableSuggestions: true,
                  onChanged: (value) {
                    provider.change_email(value);
                  },
                  decoration: InputDecoration(
                      focusedBorder: email.isEmpty ||
                              !email.contains("@") ||
                              email.length < 7
                          ? OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent))
                          : OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true),
                ),
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
                        if (email.isEmpty ||
                            email.length < 7 ||
                            !email.contains("@")) {
                          _speak("Le mail est vide ou invalide");
                          provider.affiche_false();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "L'adresse e-mail est vide ou invalide",
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
                          var result = await FirebaseFirestore.instance
                              .collection("commandes")
                              .where("client_uid", isEqualTo: email.trim())
                              .get();
                          var is_empty = result.docs.isEmpty;
                          if (is_empty == true) {
                            _speak(
                                "Aucune commande n'est enregistrée avec cette adresse mail");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aucune commande n'est enregistrée avec cette adresse e-mail",
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
                            provider.affiche_false();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StreamDesCommandesDuClient(
                                            client_uid: email)));
                          }
                          provider.affiche_false();
                        }
                      } catch (e) {
                        provider.affiche_false();
                        _speak("Une erreur s'est produite");

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
                    child: Text(
                      "Recherche".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alike(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 70,
              )
            ])));
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
