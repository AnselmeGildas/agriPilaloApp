// ignore_for_file: avoid_function_literals_in_foreach_calls, unused_local_variable, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:deogracias/interface/stream_utilisateur.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class ListUtilisateurs extends StatelessWidget {
  const ListUtilisateurs({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    int nombre = 0;
    final utilisateurs = Provider.of<List<donnesUtilisateur>>(context);
    final provider = Provider.of<Search>(context);
    String value = "";
    bool affiche = false;
    affiche = provider.afficher;
    value = provider.value;
    utilisateurs.forEach((element) {
      if (!element.admin && !element.deleted) {
        nombre++;
      }
    });

    if (nombre <= 0) {
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
          centerTitle: true,
          title: Text(
            "Utilisateurs",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
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
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        elevation: 0,
        centerTitle: true,
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
                "Utilisateurs",
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
            donnesUtilisateur utilisateur = utilisateurs[index];
            return !affiche
                ? !utilisateur.admin && !utilisateur.deleted
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamUtilisateur(
                                  utilisateur_uid: utilisateur.uid,
                                  user_password: user.mdp,
                                ),
                              ));
                        },
                        title: Text(
                          utilisateur.prenom + " " + utilisateur.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            utilisateur.nom.substring(0, 1).toUpperCase() +
                                utilisateur.prenom
                                    .substring(0, 1)
                                    .toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          "A créé son compte le " +
                              utilisateur.date_inscription,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Container()
                : (utilisateur.nom
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            utilisateur.prenom
                                .toLowerCase()
                                .contains(value.toLowerCase())) &&
                        !utilisateur.admin &&
                        !utilisateur.deleted
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamUtilisateur(
                                  utilisateur_uid: utilisateur.uid,
                                  user_password: user.mdp,
                                ),
                              ));
                        },
                        title: Text(
                          utilisateur.prenom + " " + utilisateur.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            utilisateur.nom.substring(0, 1).toUpperCase() +
                                utilisateur.prenom
                                    .substring(0, 1)
                                    .toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          "A créé son compte le " +
                              utilisateur.date_inscription,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Container();
          },
          itemCount: utilisateurs.length,
        ),
      ),
    );
  }
}
