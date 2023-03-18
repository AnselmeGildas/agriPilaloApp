// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/stream_stock_bete.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../modele/betes.dart';

class ListeBetes extends StatefulWidget {
  ListeBetes({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  State<ListeBetes> createState() => _ListeBetesState();
}

class _ListeBetesState extends State<ListeBetes> {
  String _search = "";

  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final betes = Provider.of<List<Betes>>(context);
    final provider = Provider.of<Search>(context);
    _search = provider.value;
    affiche = provider.afficher;

    if (betes.isEmpty) {
      return Scaffold(
          drawer: DrawerVagueAdmin(vague_uid: widget.vague_uid),
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
              "Betes",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          body: Center(child: CircularProgressIndicator(color: Colors.black)));
    }

    return Scaffold(
        drawer: DrawerVagueAdmin(vague_uid: widget.vague_uid),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  provider.afficher_void();
                },
                icon: Icon(Icons.search, color: Colors.black)),
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
                  "Betes",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Betes bete = betes[index];

              return !affiche
                  ? ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            _DeleteBete(
                                context, bete.nom, bete.uid, widget.vague_uid);
                          },
                          icon: Icon(Icons.delete)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StreamStockBete(
                                  vague_uid: widget.vague_uid,
                                  bete_uid: bete.uid),
                            ));
                      },
                      leading: bete.nom.isNotEmpty
                          ? CircleAvatar(
                              backgroundColor: Colors.lightBlue.shade900,
                              child: Text(
                                bete.nom.substring(0, 1).toUpperCase(),
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container(),
                      title: Text(
                        bete.nom,
                        style: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  : bete.nom.toLowerCase().contains(_search.toLowerCase())
                      ? ListTile(
                          trailing: IconButton(
                              onPressed: () {
                                _DeleteBete(context, bete.nom, bete.uid,
                                    widget.vague_uid);
                              },
                              icon: Icon(Icons.delete)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StreamStockBete(
                                    bete_uid: bete.uid,
                                    vague_uid: widget.vague_uid,
                                  ),
                                ));
                          },
                          leading: bete.nom.isNotEmpty
                              ? CircleAvatar(
                                  backgroundColor: Colors.lightBlue.shade900,
                                  child: Text(
                                    bete.nom.substring(0, 1).toUpperCase(),
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container(),
                          title: Text(
                            bete.nom,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container();
            },
            itemCount: betes.length,
          ),
        ));
  }

  Future<void> _DeleteBete(BuildContext context, String bete_nom,
      String bete_uid, String vague_uid) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Suppression".toUpperCase()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Vous etes sur le point de supprimer  " +
                    bete_nom +
                    " de la base de données de cette entreprise"),
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
                              .collection("betes")
                              .doc(bete_uid)
                              .delete();

                          _speak("Suppression effectué avec succès");

                          // ignore: empty_catches
                        } catch (e) {
                          _speak("une erreur s'est produite");
                        }
                        Navigator.of(context).pop();
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
                        _speak("Suppression du bete annulée");
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
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
