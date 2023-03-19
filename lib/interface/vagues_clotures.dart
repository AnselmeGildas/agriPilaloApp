// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls

import 'package:deogracias/interface/stream_vague_cloture.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/provider_search.dart';
import 'drawer_admin.dart';

class VaguesClotures extends StatelessWidget {
  const VaguesClotures({super.key});

  @override
  Widget build(BuildContext context) {
    final vagues = Provider.of<List<Vagues>>(context);
    final provider = Provider.of<Search>(context);
    String value = provider.value;
    bool affiche = provider.afficher;
    int nombre = 0;
    vagues.forEach((element) {
      if (element.cloture) {
        nombre++;
      }
    });
    if (nombre <= 0) {
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
          centerTitle: true,
          title: Text(
            "Vagues cloturées",
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
                  "Vagues cloturées",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Vagues vague = vagues[index];
            return !affiche
                ? vague.cloture
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamVagueCloture(
                                  vague_uid: vague.uid,
                                  user_uid: vague.user_uid,
                                ),
                              ));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            vague.nom.substring(0, 2).toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          vague.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.sell_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              vague.created_at + " à " + vague.created_at_heure,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : Container()
                : vague.nom.toLowerCase().contains(value.toLowerCase()) &&
                        vague.cloture
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamVagueCloture(
                                  vague_uid: vague.uid,
                                  user_uid: vague.user_uid,
                                ),
                              ));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            vague.nom.substring(0, 2).toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          vague.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.sell_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              vague.created_at + " à " + vague.created_at_heure,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : Container();
          },
          itemCount: vagues.length,
        ));
  }
}
