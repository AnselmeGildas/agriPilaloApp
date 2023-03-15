// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_element, prefer_const_literals_to_create_immutables, unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_admin.dart';
import 'package:deogracias/interface/provider_traiter_commande.dart';
import 'package:deogracias/modele/client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

class CommandeJournaliere extends StatelessWidget {
  const CommandeJournaliere({super.key});

  @override
  Widget build(BuildContext context) {
    bool affiche = true;
    bool traite = false;
    bool circul = false;
    bool statut = false;
    final provider = Provider.of<ProviderTraiterCommande>(context);
    affiche = provider.affiche;
    traite = provider.traite;
    circul = provider.circul;
    statut = provider.statut;
    final commande = Provider.of<Commandes>(context);
    final client = Provider.of<Clients>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    return Scaffold(
      drawer: DrawerAdmin(),
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
          "Commande",
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
              height: 40,
            ),
            Text(
              "Commande journalière",
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
              height: 40,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 2,
                        color: Colors.redAccent.withOpacity(.8))),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    "Informations sur la commande".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Commande : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.achat,
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    softWrap: true,
                    maxLines: 10,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Description : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.description,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 10,
                  ))
                ],
              ),
            ),
            commande.exigences.isNotEmpty
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exigences démandées : ",
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                            child: Text(
                          commande.exigences,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontSize: 16),
                          softWrap: true,
                          maxLines: 10,
                        ))
                      ],
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Commande : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: commande.traite
                          ? Text(
                              "Traitée".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                              maxLines: 2,
                            )
                          : Text(
                              "Non traitée".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                              maxLines: 2,
                            ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date de livraison : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.date_livraison,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Heure de livraison : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.heure_livraison,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Passée le : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.created_at + " à " + commande.created_at_heure,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 10,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Livraison serait fait par : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.venir_chercher_commande
                        ? "Client".toUpperCase()
                        : "Par l'entreprise",
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Acceptation de supporter les frais de transports : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    commande.supporter_frais_transports
                        ? "OUI".toUpperCase()
                        : "NON".toUpperCase(),
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Par : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    client.nom,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "E-Mail : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    client.email,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 2,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    client.numero,
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 10,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total de commandé passées : ",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Text(
                    client.nombre_commande.toString(),
                    style: GoogleFonts.alike(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: 10,
                  ))
                ],
              ),
            ),
            affiche
                ? Column(
                    children: [
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown.shade800),
                            onPressed: () {
                              provider.traiter_commande();
                            },
                            child: Text(
                              "Traiter la commande".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Container(),
            traite
                ? Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          "Commande déjà traitée",
                          style: GoogleFonts.alike(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: true,
                        groupValue: statut,
                        onChanged: (value) {
                          provider.change_statut(value);
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          "Commande non encore traitée",
                          style: GoogleFonts.alike(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: false,
                        groupValue: statut,
                        onChanged: (value) {
                          provider.change_statut(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown.shade800),
                            onPressed: () async {
                              try {
                                provider.circul_true();
                                await FirebaseFirestore.instance
                                    .collection("commandes")
                                    .doc(commande.uid)
                                    .update({
                                  "traite": statut,
                                });
                                provider.circul_false();

                                _speak(
                                    "Traitement de la commande éffectué avec succès");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Traitement de la commande éffectué avec succès",
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
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              } catch (e) {
                                provider.circul_false();
                                _speak("Une erreur s'est produite");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Une erreur s'est produite",
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
                              }
                            },
                            child: circul
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Traitement du commande".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  )
                : Container(),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.94,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                  onPressed: () {
                    RepondreClient(
                        context,
                        client.nom,
                        user.prenom,
                        client.email,
                        commande.achat,
                        commande.created_at,
                        commande.created_at_heure);
                  },
                  child: Text(
                    "Répondre au client".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Future<void> RepondreClient(
      BuildContext context,
      String client_nom,
      String usr_nom,
      String client_email,
      String achat,
      String created_at,
      String created_at_heure) async {
    TextEditingController message_user = TextEditingController();
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green.shade800,
          title: Text(
            "Message au client",
            textAlign: TextAlign.center,
            style: GoogleFonts.alike(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListBody(
              children: [
                Text(
                  "Réponse à la commande d' " + achat + " de " + client_nom,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.alike(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 12),
                  child: Text(
                    "Votre réponse",
                    style: GoogleFonts.alike(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: message_user,
                    maxLines: 4,
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
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          try {
                            if (message_user.text.isEmpty) {
                              _speak("Vous n'avez pas saisi le message.");
                            } else {
                              String username = 'agripiyalo@gmail.com';
                              String password = 'ghcaxojthaqzmhdc';

                              final smtpServer = gmail(username, password);
                              // Use the SmtpServer class to configure an SMTP server:
                              // final smtpServer = SmtpServer('smtp.domain.com');
                              // See the named arguments of SmtpServer for further configuration
                              // options.

                              // Create our message.
                              final message = Message()
                                ..from =
                                    Address(username, 'Agri PIYALO Entreprise')
                                ..recipients.add(client_email.trim())
                                ..ccRecipients
                                //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                                //..bccRecipients.add(Address('bccAddress@example.com'))
                                ..subject =
                                    "Réponse à votre commande d'" + achat
                                ..text = "Mr/Mme  " +
                                    client_nom +
                                    "\n Notre réponse à votre commande d'" +
                                    achat +
                                    " faite le " +
                                    created_at +
                                    " à " +
                                    created_at_heure +
                                    "  est ceci:  " +
                                    message_user.text +
                                    "\n Merci pour la confiance cher Client";
                              //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                              final sendReport =
                                  await send(message, smtpServer);
                              _speak(
                                  "Votre réponse a été envoyé par mail au client. Merci " +
                                      usr_nom);
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            _speak("Une erreur s'est produite");
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Répondre ".toUpperCase() + client_nom,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
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
