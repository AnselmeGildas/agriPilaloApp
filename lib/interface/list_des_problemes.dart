// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:deogracias/interface/stream_probleme.dart';
import 'package:deogracias/modele/problemes.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class ListDesProblemes extends StatefulWidget {
  ListDesProblemes({super.key});

  @override
  State<ListDesProblemes> createState() => _ListDesProblemesState();
}

class _ListDesProblemesState extends State<ListDesProblemes> {
  bool affiche = false;

  String value = "";

  @override
  Widget build(BuildContext context) {
    final problems = Provider.of<List<Problemes>>(context);
    final provider = Provider.of<Search>(context);
    affiche = provider.afficher;
    value = provider.value;

    if (problems.isEmpty) {
      return Scaffold(
          backgroundColor: Colors.green.shade800,
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
              "Problèmes des employés",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          body: Center(child: CircularProgressIndicator(color: Colors.white)));
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
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 50,
            width: 50,
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
                "Problèmes des employés",
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
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Problemes probleme = problems[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamProbleme(
                                  probleme_uid: probleme.uid,
                                  probleme_user_uid: probleme.user_uid)));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade900,
                      child: Text(
                        "AP".toUpperCase(),
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      probleme.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Enregistré le " +
                          probleme.created_at +
                          " à " +
                          probleme.created_at_heure,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : probleme.description
                        .toLowerCase()
                        .contains(value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamProbleme(
                                      probleme_uid: probleme.uid,
                                      probleme_user_uid: probleme.user_uid)));
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
                        title: Text(
                          probleme.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Enregistré le " +
                              probleme.created_at +
                              " à " +
                              probleme.created_at_heure,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Container();
          },
          itemCount: problems.length,
        ),
      ),
    );
  }
}
