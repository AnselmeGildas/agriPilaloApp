// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_admin.dart';
import 'package:deogracias/interface/stream_perte.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/pertes.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListePerte extends StatefulWidget {
  ListePerte({super.key});

  @override
  State<ListePerte> createState() => _ListePerteState();
}

class _ListePerteState extends State<ListePerte> {
  String value = "";

  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final pertes = Provider.of<List<Pertes>>(context);
    final provider = Provider.of<Search>(context);
    value = provider.value;
    affiche = provider.afficher;
    final budget = Provider.of<Budget>(context);
    if (pertes.isEmpty) {
      return Scaffold(
        drawer: DrawerAdmin(),
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
            "Pertes",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black87,
          ),
        ),
      );
    }
    final vague = Provider.of<Vagues>(context);
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                provider.afficher_void();
              },
              icon: Icon(Icons.search, color: Colors.black)),
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        elevation: 0,
        centerTitle: false,
        title: affiche
            ? Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    provider.change_value(value);
                  },
                ),
              )
            : Text(
                "Pertes",
                style: GoogleFonts.alike(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Pertes perte = pertes[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StreamPerte(
                                vague_uid: vague.uid,
                                perte_uid: perte.uid,
                                user_uid: perte.user_uid),
                          ));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade900,
                      child: Text(
                        "AP".toUpperCase(),
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          _update(context, perte.uid, perte.description,
                              perte.montant, budget.uid, budget.perte);
                        },
                        icon: Icon(Icons.edit)),
                    subtitle: Row(children: [
                      Icon(Icons.sell_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        perte.created_at + " à " + perte.created_at_heure,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                    ]),
                    title: Text(
                      perte.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                : perte.description.toLowerCase().contains(value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamPerte(
                                    vague_uid: vague.uid,
                                    perte_uid: perte.uid,
                                    user_uid: perte.user_uid),
                              ));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            "AP".toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              _update(context, perte.uid, perte.description,
                                  perte.montant, budget.uid, budget.perte);
                            },
                            icon: Icon(Icons.edit)),
                        subtitle: Row(
                          children: [
                            Icon(Icons.sell_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              perte.created_at + " à " + perte.created_at_heure,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        title: Text(
                          perte.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container();
          },
          itemCount: pertes.length,
        ),
      ),
    );
  }

  Future<void> _update(
    BuildContext context,
    String depense_uid,
    String depense_description,
    int depense_montzant,
    String budget_uid,
    int budget_depense,
  ) async {
    TextEditingController _description = TextEditingController();
    TextEditingController _montant = TextEditingController();
    _description.text = depense_description;
    _montant.text = depense_montzant.toString();
    int _depense = 0;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            "Mise à jour de la perte",
            style: GoogleFonts.alike(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Description de la perte",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _description,
                    enableSuggestions: true,
                    autocorrect: true,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Montant de la perte ",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _montant,
                  ),
                ),
                SizedBox(
                  height: 10,
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
                          _depense = _montant.text.isNotEmpty
                              ? int.parse(_montant.text)
                              : 0;
                          if (_description.text.isEmpty ||
                              _montant.text.isEmpty) {
                            _speak(
                                "Tous les champs n'ont pas été renseigné. Réessayez s'il vous plait ");
                          } else {
                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(budget_uid)
                                .update({
                              "perte": _depense > depense_montzant
                                  ? budget_depense +
                                      (_depense - depense_montzant)
                                  : budget_depense -
                                      (depense_montzant - _depense)
                            });

                            await FirebaseFirestore.instance
                                .collection("pertes")
                                .doc(depense_uid)
                                .update({
                              "montant": _depense,
                              "description": _description.text
                            });

                            _speak("Mise à jour effectué avec succès");
                            Navigator.of(dialogContext).pop();
                          }

                          // ignore: empty_catches
                        } catch (e) {
                          _speak(
                              "Une erreur inattendue s'est produite. Vérifiez votre connection internet et réessayez s'il vous plait");
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
                        _speak("Mise à jour de la perte annulée");
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
      },
    );
  }

  Future _speak(String text) async {
    final FlutterTts _flutter_tts = FlutterTts();
    _flutter_tts.setLanguage("Fr");
    _flutter_tts.setSpeechRate(0.5);
    _flutter_tts.setVolume(0.5);
    _flutter_tts.setPitch(1.0);
    _flutter_tts.speak(text);
  }
}
