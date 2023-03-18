// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, non_constant_identifier_names

import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/stream_signaler_bete_mort_retablie.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../modele/betes.dart';

class SignalerBetesMortRetablie extends StatefulWidget {
  SignalerBetesMortRetablie({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  State<SignalerBetesMortRetablie> createState() =>
      _SignalerBetesMortRetablieState();
}

class _SignalerBetesMortRetablieState extends State<SignalerBetesMortRetablie> {
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
            centerTitle: true,
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StreamSignalerBeteMortRetablie(
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Nombre restant : " + bete.nombre_restant.toString(),
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                    )
                  : bete.nom.toLowerCase().contains(_search.toLowerCase())
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StreamSignalerBeteMortRetablie(
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Nombre restant : " +
                                bete.nombre_restant.toString(),
                            style:
                                GoogleFonts.alike(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container();
            },
            itemCount: betes.length,
          ),
        ));
  }
}
