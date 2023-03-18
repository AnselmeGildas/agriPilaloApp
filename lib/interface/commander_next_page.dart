// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable, use_build_context_synchronously, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/provider/provider_gestion_commande.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

class CommanderSecondPage extends StatefulWidget {
  const CommanderSecondPage(
      {super.key,
      required this.pays,
      required this.departement,
      required this.commune,
      required this.arrondissement,
      required this.nom,
      required this.email,
      required this.numero,
      required this.achat,
      required this.description,
      required this.exigences_cllient,
      required this.date_livraison,
      required this.venir_chercher,
      required this.heure_livraison});
  final String pays;
  final String departement;
  final String commune;
  final String arrondissement;
  final String nom;
  final String email;
  final String numero;
  final String achat;
  final String description;
  final String exigences_cllient;
  final String date_livraison;
  final bool venir_chercher;
  final String heure_livraison;

  @override
  State<CommanderSecondPage> createState() => _CommanderSecondPageState();
}

class _CommanderSecondPageState extends State<CommanderSecondPage> {
  @override
  void initState() {
    super.initState();
    _speak(
        "Veuillez finaliser la commande. Si vous avez du mal à retrouver les coordonnées g p s , veuillez nous indiquer votre lieu. Vous devez également accepter de supporter les frais de transports");
  }

  bool supporter_frais_transport = true;
  String coordonnees_gps = "";
  String indication = "";
  bool affiche = false;
  bool is_empty = true;
  TextEditingController _indication = TextEditingController();
  TextEditingController _coordonnees = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderGestionCommande>(context);
    supporter_frais_transport = provider.supporter_frais_transports;
    indication = provider.indication;
    coordonnees_gps = provider.coordonnees_gps;
    affiche = provider.affiche;
    return Scaffold(
        drawer: DrawerClient(),
        backgroundColor: Colors.green.shade800,
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
          centerTitle: true,
          title: Text(
            "Finaliser la commande",
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
                "Finaliser la commande",
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
                padding: const EdgeInsets.only(left: 15, bottom: 0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Allez vous supportez les frais de transports?",
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
                    groupValue: supporter_frais_transport,
                    onChanged: (value) {
                      provider.changer_supporter_frais_transport(value!);
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
                    groupValue: supporter_frais_transport,
                    onChanged: (value) {
                      provider.changer_supporter_frais_transport(value!);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Coordonnées GPS du lieu de livraison",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _coordonnees,
                  onTap: () {
                    _speak(
                        "Servez vous de Google Map pour obtenir les coordonnéés G *P S ");
                  },
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: coordonnees_gps.isEmpty ||
                                  coordonnees_gps.length < 15
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.changer_coordonnees_gps(value);
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Veuillez nous indiquer le lieu de livraison",
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
                    _speak("Indiquez en détail le lieu de livraison");
                  },
                  controller: _indication,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              indication.isEmpty || indication.length < 15
                                  ? BorderSide(color: Colors.red)
                                  : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_indication(value);
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
                child: SizedBox(
                  height: 47,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87),
                      onPressed: () async {
                        try {
                          if (indication.isEmpty && coordonnees_gps.isEmpty ||
                              _indication.text.isEmpty ||
                              _coordonnees.text.isEmpty) {
                            provider.affiche_false();
                            _speak(
                                "Vous devriez soit renseigner les coordonnées g p s ou soit indiquer en detail le lieu de livraison. Tachez d'accepter également les frais de transport");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous devez renseigner les coordonnées gps ou indiquer en détail le lieu de livraison. !",
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
                                .collection("clients")
                                .where("email", isEqualTo: widget.email)
                                .get();
                            is_empty = result.docs.isEmpty;

                            if (is_empty) {
                              await FirebaseFirestore.instance
                                  .collection("clients")
                                  .doc(widget.email)
                                  .set({
                                "email": widget.email,
                                "nom": widget.nom.toUpperCase(),
                                "numero": widget.pays == "BENIN"
                                    ? "+229" + widget.numero
                                    : "+228" + widget.numero,
                                "departement": widget.pays == "BENIN"
                                    ? widget.departement
                                    : "",
                                "commune": widget.pays == "BENIN"
                                    ? widget.commune
                                    : "",
                                "arrondissement": widget.pays == "BENIN"
                                    ? widget.arrondissement
                                    : "",
                                "created_atb": DateTime.now()
                              });

                              await FirebaseFirestore.instance
                                  .collection("commandes")
                                  .add({
                                "heure_livraison": widget.heure_livraison,
                                "traite": false,
                                "client_uid": widget.email,
                                "achat": "achat de " + widget.achat,
                                "description": widget.description,
                                "exigences": widget.exigences_cllient,
                                "date_livraison": widget.date_livraison,
                                "venir_chercher_commande":
                                    widget.venir_chercher,
                                "supporter_frais_transport":
                                    supporter_frais_transport,
                                "created_at": DateTime.now(),
                                "updated_at": DateTime.now(),
                                "coordonnees_gps": coordonnees_gps,
                                "indication": indication
                              });
                            } else {
                              await FirebaseFirestore.instance
                                  .collection("commandes")
                                  .add({
                                "heure_livraison": widget.heure_livraison,
                                "traite": false,
                                "client_uid": widget.email,
                                "achat": "achat de " + widget.achat,
                                "description": widget.description,
                                "exigences": widget.exigences_cllient,
                                "date_livraison": widget.date_livraison,
                                "venir_chercher_commande":
                                    widget.venir_chercher,
                                "supporter_frais_transport":
                                    supporter_frais_transport,
                                "created_at": DateTime.now(),
                                "updated_at": DateTime.now(),
                                "coordonnees_gps": coordonnees_gps,
                                "indication": indication
                              });
                            }
                            String username = 'agripilalo@gmail.com';
                            String password = 'kgbadpzwmbaxkzch';

                            final smtpServer = gmail(username, password);
                            // Use the SmtpServer class to configure an SMTP server:
                            // final smtpServer = SmtpServer('smtp.domain.com');
                            // See the named arguments of SmtpServer for further configuration
                            // options.

                            // Create our message.
                            final message = Message()
                              ..from =
                                  Address(username, 'Agri Pilalo Entreprise')
                              ..recipients.add(widget.email.trim())
                              ..ccRecipients
                              //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                              //..bccRecipients.add(Address('bccAddress@example.com'))
                              ..subject = "Commande passée"
                              ..text = " " +
                                  widget.nom +
                                  " \n Votre commande a été enregistrée avec succès. Elle sera prete avant la date de livraison que vous avez démandée. Nous vous garantissons aussi de prendre en compte toutes vos exigences. \n Merci pour la confiance, cher client";
                            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                            final sendReport = await send(message, smtpServer);

                            provider.affiche_false();
                            _speak(
                                "Votre commande a été enregistrée avec succès");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Commande enregistrée avec succès",
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
                      child: Text(
                        "Lancer la commande".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ])));
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
