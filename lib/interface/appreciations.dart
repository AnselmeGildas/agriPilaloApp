// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings

import 'package:deogracias/interface/drawer_admin.dart';
import 'package:deogracias/interface/stream_appreciation.dart';
import 'package:deogracias/modele/appreciations.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppreciationsClients extends StatefulWidget {
  AppreciationsClients({super.key});

  @override
  State<AppreciationsClients> createState() => _AppreciationsClientsState();
}

class _AppreciationsClientsState extends State<AppreciationsClients> {
  String value = "";

  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final appreciations = Provider.of<List<Appreciations>>(context);
    final provider = Provider.of<Search>(context);
    value = provider.value;
    affiche = provider.afficher;

    if (appreciations.isEmpty) {
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
            "Appréciations",
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
                "Appréciations",
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
            Appreciations appreciation = appreciations[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamAppreciation(
                                  appreciation_uid: appreciation.uid)));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade900,
                      child: Text(
                        "AP".toUpperCase(),
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "Enregistré par " +
                          appreciation.nom +
                          " le " +
                          appreciation.created_at +
                          " à " +
                          appreciation.created_at_heure,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    title: Text(
                      appreciation.appreciation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                : appreciation.appreciation
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        appreciation.nom
                            .toLowerCase()
                            .contains(value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamAppreciation(
                                      appreciation_uid: appreciation.uid)));
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
                        subtitle: Text(
                          "Enregistré par " +
                              appreciation.nom +
                              " le " +
                              appreciation.created_at +
                              " à " +
                              appreciation.created_at_heure,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        title: Text(
                          appreciation.appreciation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container();
          },
          itemCount: appreciations.length,
        ),
      ),
    );
  }
}
