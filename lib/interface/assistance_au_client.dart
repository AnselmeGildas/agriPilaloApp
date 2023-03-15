// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/modele/assistances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class AssistanceAuClient extends StatelessWidget {
  const AssistanceAuClient({super.key});

  @override
  Widget build(BuildContext context) {
    final assistance = Provider.of<Assistances>(context);
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
        centerTitle: false,
        title: Text(
          "Assistance au client",
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
              "Assistance au client",
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
              width: MediaQuery.of(context).size.width * 0.94,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.89,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade900),
                        onPressed: () {},
                        child: Text(
                          "Informations sur le client".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nom du client",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            assistance.nom,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Assistance démandé :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            assistance.message,
                            maxLines: 20,
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Adresse E-Mail",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            assistance.email,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            assistance.numero,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enregistré le :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            assistance.created_at +
                                " à " +
                                assistance.created_at_heure,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Statut de la démande :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            assistance.repondu
                                ? "Dèjà répondu".toUpperCase()
                                : "Non encore répondu".toUpperCase(),
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: assistance.repondu
                                    ? Colors.green.shade900
                                    : Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  !assistance.repondu
                      ? SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.89,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue.shade900),
                              onPressed: () {
                                RepondreClient(
                                    context,
                                    assistance.nom,
                                    assistance.email,
                                    assistance.message,
                                    assistance.uid,
                                    assistance.created_at,
                                    assistance.created_at_heure);
                              },
                              child: Text(
                                "Répondre au client".toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      : Container(),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
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
      String client_email,
      String demande,
      String assistance_uid,
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
            "Réponse à la démande d'aide",
            textAlign: TextAlign.justify,
            style: GoogleFonts.alike(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Réponse à la démande d'aide  de " + client_nom,
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
                    "Votre message",
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
                              _speak("Envoi de mail en cours");
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
                                    "Réponse à votre appréciation de nos services de prestations"
                                ..text = "Mr/Mme  " +
                                    client_nom +
                                    "\n Notre réponse à votre démande d'aide :<< " +
                                    demande +
                                    " >> faite le " +
                                    created_at +
                                    " à " +
                                    created_at_heure +
                                    "  est ceci:  " +
                                    message_user.text +
                                    "\n Merci pour la confiance cher Client";
                              //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                              final sendReport =
                                  await send(message, smtpServer);
                              await FirebaseFirestore.instance
                                  .collection("assistances")
                                  .doc(assistance_uid)
                                  .update({"repondu": true});
                              _speak(
                                  "Votre réponse a été envoyé par mail au client. Merci ");
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
          // ignore: prefer_const_literals_to_create_immutables
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
