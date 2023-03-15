// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_element, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/interface/stream_modifier_commande_du_client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommandeDuClient extends StatelessWidget {
  const CommandeDuClient({super.key});

  @override
  Widget build(BuildContext context) {
    final commande = Provider.of<Commandes>(context);
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerClient(),
      appBar: AppBar(
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
        title: Text(
          "Votre commande",
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
              "Votre commande",
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
                    "Informations sur votre commande".toUpperCase(),
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
                                  color: Colors.indigo, fontSize: 14),
                              softWrap: true,
                              maxLines: 2,
                            )
                          : Text(
                              "Non traitée".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.redAccent, fontSize: 14),
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
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown.shade800),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StreamModifierCommandeDuClient(
                                          client_uid: commande.client_uid,
                                          commande_uid: commande.uid)));
                        },
                        child: Text(
                          "Modifier".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        onPressed: () {
                          _DeleteCommande(context, commande.client_uid,
                              commande.uid, commande.achat);
                        },
                        child: Text(
                          "Supprimer".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
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

  Future<void> _DeleteCommande(
    BuildContext context,
    String client_uid,
    String commande_uid,
    String achat,
  ) async {
    int i = 0;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Etes vous sur ?".toUpperCase()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Vous etes sur le point de supprimer cette commande d' " +
                    achat),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Confirmer'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        try {
                          final result = await FirebaseFirestore.instance
                              .collection("commandes")
                              .where("client_uid", isEqualTo: client_uid)
                              .get();
                          final documents = result.docs;

                          for (var document in documents) {
                            if (document.id.isNotEmpty) {
                              i++;
                            }
                          }

                          if (i <= 1) {
                            await FirebaseFirestore.instance
                                .collection("clients")
                                .doc(client_uid)
                                .delete();
                          }
                          await FirebaseFirestore.instance
                              .collection("commandes")
                              .doc(commande_uid)
                              .delete();

                          _speak("votre commande a été supprimée avec succès");

                          // ignore: empty_catches
                        } catch (e) {
                          _speak("Une erreur inattendue s'est produite ");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(.7),
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Annuler'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        _speak("Suppression de la commande annulée");
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
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
