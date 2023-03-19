// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:deogracias/interface/a_propos_de_nous.dart';
import 'package:deogracias/interface/besoin_daide.dart';
import 'package:deogracias/interface/commander.dart';
import 'package:deogracias/interface/connexion.dart';
import 'package:deogracias/interface/consulter_listes_des_commandes_par_le_client.dart';
import 'package:deogracias/interface/contact_entreprise.dart';
import 'package:deogracias/interface/creer_compte.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/interface/message_au_developpeur.dart';
import 'package:deogracias/interface/termes_et_donditions_d_utilisation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  void initState() {
    super.initState();
    _speak("Soyez les bienvenues");
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> ShowExitApp() async {
      return await showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: Text(
                    "AGRIPILAYO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  content: Text(
                    "Voulez vous vraiment quitter cette application ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade900),
                            onPressed: (() {
                              Navigator.of(context).pop(true);
                            }),
                            child: Text(
                              "Confirmer",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: (() {
                              Navigator.of(context).pop(false);
                            }),
                            child: Text(
                              "Annuler",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              })) ??
          false;
    }

    return WillPopScope(
      onWillPop: ShowExitApp,
      child: Scaffold(
        drawer: DrawerClient(),
        backgroundColor: Colors.green.shade800,
        appBar: AppBar(
          title: Text(
            "AGRIPILAYO",
            style: GoogleFonts.alike(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: [
            Image.asset(
              "images/icon2.jpg",
              scale: 4.5,
              height: 100,
              width: 100,
            ),
          ],
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "B".toUpperCase(),
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  Text(
                    "ienvenue sur AGRIPILAYO",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Un plat garantit une meilleure vie. Nous mettons à votre disposition des pinthades, poulets, oeuf de table, golliaths, dindons ... ",
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Image.asset(
                "images/image11.jpeg",
                scale: 4.5,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Des poulles et divers de très bonne qualité",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Image.asset(
                "images/image10.jpeg",
                scale: 4.5,
                fit: BoxFit.cover,
                height: 270,
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Voudriez vous tester notre dynamysme ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Passez la commande ",
                    style: GoogleFonts.alike(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "images/sticker.png",
                    scale: 2.5,
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Commande()));
                    },
                    child: Text(
                      "Commandez".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alike(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.white,
                        width: 4)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListeDesCommandesDuClient()));
                    },
                    child: Text(
                      "Consulter la liste de vos commandes",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alike(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "N'avez vous pas encore un compte sur cette application ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Créer un compte".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alike(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Si vous avez déjà un compte !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Connectez vous alors".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alike(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.black87.withOpacity(.8),
                width: double.infinity,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "images/icon2.jpg",
                            scale: 2.4,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "images/image2.jpeg",
                            scale: 2.4,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Agri PILALO",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Colors.white,
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AProposDeNous(),
                                  ));
                            },
                            child: Text(
                              "A propos de nous",
                              style: GoogleFonts.alike(
                                color: Colors.white,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContactsEntreprise(),
                                  ));
                            },
                            child: Text(
                              "Contacts",
                              style: GoogleFonts.alike(
                                color: Colors.white,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BesoinDAide(),
                                  ));
                            },
                            child: Text(
                              "Assistance",
                              style: GoogleFonts.alike(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TermesConditionsUtilisation(),
                                  ));
                            },
                            child: Text(
                              "Conditions d'utilisation",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Privacy",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.brown.shade800,
                              width: 5)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MessageAuDeveloppeur(),
                                ));
                          },
                          child: Text(
                            "Un message au développeur ? ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
