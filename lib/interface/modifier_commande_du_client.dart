// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/consulter_listes_des_commandes_par_le_client.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:deogracias/provider/provider_recherche_commande_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

class ModifierCommandeDuClient extends StatelessWidget {
  ModifierCommandeDuClient({super.key});

  TextEditingController achat = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date_livraison = TextEditingController();
  TextEditingController heure_livraison = TextEditingController();
  TextEditingController exigences = TextEditingController();
  TextEditingController indication = TextEditingController();
  TextEditingController coordonnees_gps = TextEditingController();
  bool venir_chercher = true;
  bool supporter_frais_transports = true;
  String _achat = "";
  String _description = "";
  String _exigences = "";
  String _indication = "";
  String _coordonnees = "";
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderRechercheCommandeClient>(context);
    _achat = provider.achat;
    circular = provider.circular;
    _description = provider.description;
    _exigences = provider.exigences;
    _indication = provider.indication;
    _coordonnees = provider.coordonnees;
    final commande = Provider.of<Commandes>(context);
    achat.text = commande.achat;
    heure_livraison.text = commande.heure_livraison;
    date_livraison.text = commande.date_livraison;
    description.text = commande.description;
    date_livraison.text = commande.date_livraison;
    exigences.text = commande.exigences;
    indication.text = commande.indication;
    coordonnees_gps.text = commande.coordonnees_gps;
    venir_chercher = provider.venir_chercher_commande;
    supporter_frais_transports = provider.supporter_frais_transport;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerClient(),
      appBar: AppBar(
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Modifier votre commande ",
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
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
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Que voulez-vous acheter svp ?",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 30),
              child: TextField(
                onChanged: (value) {
                  provider.changer_achat(value);
                },
                controller: achat,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: _achat.isEmpty || _achat.length < 7
                            ? BorderSide(color: Colors.redAccent)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Décrivez la commande svp",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 30),
              child: TextField(
                onChanged: (value) {
                  provider.changer_description(value);
                },
                controller: description,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            _description.isEmpty || _description.length < 7
                                ? BorderSide(color: Colors.redAccent)
                                : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date de livraison svp !",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 30),
              child: TextField(
                onTap: () async {
                  _speak("Veuillez choisir la date de livraison");
                  DateTime? dateSelectionned = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  String format =
                      DateFormat('dd-MM-yyyy').format(dateSelectionned!);
                  if (format.isNotEmpty) {
                    date_livraison.text = format;
                  } else {
                    date_livraison.text = commande.date_livraison;
                  }
                },
                controller: date_livraison,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            _description.isEmpty || _description.length < 7
                                ? BorderSide(color: Colors.redAccent)
                                : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Heure de livraison svp",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextFormField(
                  onTap: () async {
                    _speak(
                        "veuillez préciser l'heure de livraison de votre commande");
                    TimeOfDay? pickedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (pickedTime != null) {
                      DateTime? parsedTime = DateFormat.Hm()
                          .parse(pickedTime.format(context).toString());
                      String formatTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      heure_livraison.text = formatTime;
                    } else {
                      heure_livraison.text = commande.heure_livraison;
                    }
                  },
                  controller: heure_livraison,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black)),
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quelles sont vos exigences ?",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 30),
              child: TextField(
                onChanged: (value) {
                  provider.changer_exigences(value);
                },
                controller: exigences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: _exigences.isEmpty || _exigences.length < 7
                            ? BorderSide(color: Colors.redAccent)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pourriez-vous venir chercher votre commande ?",
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
                  groupValue: venir_chercher,
                  onChanged: (value) {
                    provider.change_venir_chercher_commande(value!);
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
                  groupValue: venir_chercher,
                  onChanged: (value) {
                    provider.change_venir_chercher_commande(value!);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            venir_chercher
                ? Container()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Allez vous supportez les frais de transports puisque vous ne pouvez pas venir vous-mêmes ?",
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
                            groupValue: supporter_frais_transports,
                            onChanged: (value) {
                              provider
                                  .change_supporter_frais_transports(value!);
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
                            groupValue: supporter_frais_transports,
                            onChanged: (value) {
                              provider
                                  .change_supporter_frais_transports(value!);
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
                          controller: coordonnees_gps,
                          autocorrect: true,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: _coordonnees.isEmpty ||
                                          _coordonnees.length < 15
                                      ? BorderSide(color: Colors.red)
                                      : BorderSide(color: Colors.blue)),
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          onChanged: (value) {
                            provider.changer_coordonnees(value);
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
                          controller: indication,
                          autocorrect: true,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: _indication.isEmpty ||
                                          _indication.length < 15
                                      ? BorderSide(color: Colors.red)
                                      : BorderSide(color: Colors.blue)),
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          onChanged: (value) {
                            provider.changer_indication(value);
                          },
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 47,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: venir_chercher
                          ? Colors.brown.shade800
                          : Colors.white),
                  onPressed: () async {
                    try {
                      provider.circular_true();

                      if (heure_livraison.text.isEmpty ||
                          achat.text.isEmpty ||
                          description.text.isEmpty ||
                          date_livraison.text.isEmpty ||
                          !venir_chercher &&
                              (indication.text.isEmpty ||
                                  coordonnees_gps.text.isEmpty)) {
                        provider.circular_false();
                        _speak(
                            "RQenseignez bien les informations et tachez d'indiquer le lieu de livraison ou les coordonnées g p s");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous devez renseigner les coordonnées gps ou indiquer en détail le lieu de livraison.. !",
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
                            .collection("commandes")
                            .doc(commande.uid)
                            .update({
                          "heure_livraison": heure_livraison.text,
                          "achat": achat.text,
                          "description": description.text,
                          "exigences": exigences.text,
                          "date_livraison": date_livraison.text,
                          "venir_chercher_commande": venir_chercher,
                          "supporter_frais_transport":
                              supporter_frais_transports,
                          "updated_at": DateTime.now(),
                          "coordonnees_gps": coordonnees_gps.text,
                          "indication": indication.text
                        });
                        String username = 'agripilalo@gmail.com';
                        String password = 'kgbadpzwmbaxkzch';

                        final smtpServer = gmail(username, password);
                        // Use the SmtpServer class to configure an SMTP server:
                        // final smtpServer = SmtpServer('smtp.domain.com');
                        // See the named arguments of SmtpServer for further configuration
                        // options.

                        // Create our message.
                        final message = Message()
                          ..from = Address(username, 'Agripilayo')
                          ..recipients.add(commande.client_uid.trim())
                          ..ccRecipients
                          //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                          //..bccRecipients.add(Address('bccAddress@example.com'))
                          ..subject = "Mise à jour de la commande"
                          ..text = "Cher client,\n Votre commande d'" +
                              commande.achat +
                              " a été mise à jour avec succès. Nous vous garantissons de prendre en compte toutes vos modifications. \n Merci pour la confiance et la fidélité.";
                        //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                        final sendReport = await send(message, smtpServer);

                        provider.circular_false();
                        _speak("Votre commande a été mise à jour avec succès");

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Commande modifiée avec succès",
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (Context) =>
                                    ListeDesCommandesDuClient()));
                      }
                    } catch (e) {
                      provider.circular_false();
                      _speak("Une erreur s'est produite");
                      final snakbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Une erreur s'est produite !",
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
                  child: circular
                      ? CircularProgressIndicator(
                          color: Colors.cyan,
                        )
                      : Text(
                          "Modifier la commande".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: venir_chercher
                                  ? Colors.white
                                  : Colors.black87,
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
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
