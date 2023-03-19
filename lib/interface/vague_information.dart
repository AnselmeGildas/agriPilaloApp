// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/stream_vague_for_welcome.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VagueInformation extends StatelessWidget {
  VagueInformation({super.key});

  int benefice = 0;

  int depense = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<BudgetTiers>(context);
    final vague = Provider.of<Vagues>(context);
    depense = budget.depense + budget.perte;
    if (budget.solde_total > depense) {
      benefice = budget.solde_total - depense;
    } else {
      benefice = 0;
    }
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerVagueAdmin(vague_uid: vague.uid),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Agri Pilalo",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          Image.asset(
            "images/icon2.jpg",
            height: 70,
            width: 70,
            scale: 4.5,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  vague.nom,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.lightBlue.shade900)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Solde actuel",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      budget.solde_total.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 60,
                              color: Colors.lightBlue.shade900,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bénéfice brute",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      benefice.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.lightBlue.shade900)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dépenses",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      budget.depense.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 60,
                              color: Colors.lightBlue.shade900,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pertes",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      budget.perte.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      height: 45,
                      alignment: Alignment.center,
                      color: Colors.lightBlue.shade900,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Informations sur la vague",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.rule_sharp,
                            color: Colors.white,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.lightBlue.shade900,
                              width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Description de la vague :",
                                  style: GoogleFonts.alike(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue.shade800),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    vague.description,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.alike(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue.shade800),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Statut de la vague :",
                                  style: GoogleFonts.alike(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue.shade800),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                !vague.cloture
                                    ? Expanded(
                                        child: Text(
                                          "Vague en cours".toUpperCase(),
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.alike(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green.shade900),
                                        ),
                                      )
                                    : Expanded(
                                        child: Text(
                                          "Vague cloturée".toUpperCase(),
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.alike(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      )
                              ],
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Vague créée le  :",
                                  style: GoogleFonts.alike(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue.shade800),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    vague.created_at +
                                        " à " +
                                        vague.created_at_heure,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.alike(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue.shade800),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Par :",
                                  style: GoogleFonts.alike(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue.shade800),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    user.prenom + " " + user.nom,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.alike(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue.shade800),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            vague.cloture
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Vague cloturéé le :",
                                            style: GoogleFonts.alike(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Colors.lightBlue.shade800),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              vague.updated_att +
                                                  " à " +
                                                  vague.updated_at_heure,
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.alike(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors
                                                      .lightBlue.shade800),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Vague ouverte le :",
                                            style: GoogleFonts.alike(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Colors.lightBlue.shade800),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              vague.updated_att +
                                                  " à " +
                                                  vague.updated_at_heure,
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.alike(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors
                                                      .lightBlue.shade800),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),
                                    ],
                                  ),
                            !vague.cloture
                                ? SizedBox(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width,
                                    child: Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.redAccent),
                                          onPressed: () {
                                            _ChangeState(context, vague.nom,
                                                vague.uid, vague.cloture);
                                          },
                                          child: Text(
                                            "Cloturez la vague".toUpperCase(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.alike(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                    ),
                                  )
                                : SizedBox(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width,
                                    child: Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.green.shade800),
                                          onPressed: () {
                                            _ChangeState(context, vague.nom,
                                                vague.uid, vague.cloture);
                                          },
                                          child: Text(
                                            "Rélancez la vague".toUpperCase(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.alike(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                            SizedBox(
                              height: 22,
                            ),
                            vague.cloture
                                ? Container()
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: 48,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Expanded(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors
                                                      .lightBlue.shade900),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          StreamVagueForWelcome(
                                                              vague_uid:
                                                                  vague.uid),
                                                    ));
                                              },
                                              child: Text(
                                                "Accédez à la vague"
                                                    .toUpperCase(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.alike(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 22,
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _ChangeState(BuildContext context, String vague_nom,
      String vague_uid, bool state) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(
              "Etes vous sur ?".toUpperCase(),
              style: GoogleFonts.alike(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  !state
                      ? Text(
                          "Voulez vous vraiment cloturér la " +
                              vague_nom.toLowerCase(),
                          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "Voulez vous vraiment rélancer la " +
                              vague_nom.toLowerCase(),
                          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                        ),
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
                          try {
                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(vague_uid)
                                .update({
                              "cloture": !state,
                              "updated_at": DateTime.now()
                            });
                            _speak("Effectué avec succès");
                            Navigator.of(dialogContext).pop();

                            // ignore: empty_catches
                          } catch (e) {
                            _speak("Une erreur inattendue s'est produite");
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
                          _speak("Mise à jour annulée");
                          Navigator.of(dialogContext).pop();
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
        });
  }

  Future _speak(String text) async {
    final FlutterTts flutter_tts = FlutterTts();
    flutter_tts.setLanguage("Fr");
    flutter_tts.setSpeechRate(0.5);
    flutter_tts.setVolume(0.5);
    flutter_tts.setPitch(1.0);
    flutter_tts.speak(text);
  }
}
