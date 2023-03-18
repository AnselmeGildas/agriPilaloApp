// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/interface/stream_commande_du_client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommandesDuClient extends StatelessWidget {
  CommandesDuClient({super.key});

  bool afficher = true;
  String value = "";

  @override
  Widget build(BuildContext context) {
    final commandes = Provider.of<List<Commandes>>(context);
    final search = Provider.of<Search>(context);
    afficher = search.afficher;
    value = search.value;
    if (commandes.isEmpty) {
      return Scaffold(
        drawer: DrawerClient(),
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
            "Commandes",
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
        drawer: DrawerClient(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  search.afficher_void();
                },
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                  size: 30,
                )),
            Image.asset(
              "images/icon2.jpg",
              scale: 4.5,
              height: 100,
              width: 100,
            ),
          ],
          elevation: 0,
          centerTitle: true,
          title: !afficher
              ? Text(
                  "Commandes",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )
              : Padding(
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
                      search.change_value(value);
                    },
                  ),
                ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              Commandes commande = commandes[index];
              return !afficher
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StreamCommande(
                                      client_uid: commande.client_uid,
                                      commande_uid: commande.uid,
                                    )));
                      },
                      title: Text(
                        commande.achat,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(
                          "AP",
                          style: GoogleFonts.alike(color: Colors.white),
                        ),
                      ),
                      subtitle: Text(
                        "Passée le " +
                            commande.created_at +
                            " à " +
                            commande.created_at_heure,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                    )
                  : commande.achat.toLowerCase().contains(value) ||
                          commande.description.toLowerCase().contains(value)
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StreamCommande(
                                          client_uid: commande.client_uid,
                                          commande_uid: commande.uid,
                                        )));
                          },
                          title: Text(
                            commande.achat,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Text(
                              "AP",
                              style: GoogleFonts.alike(color: Colors.white),
                            ),
                          ),
                          subtitle: Text(
                            "Passée le " +
                                commande.created_at +
                                " à " +
                                commande.created_at_heure,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                GoogleFonts.alike(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container();
            }),
            itemCount: commandes.length,
          ),
        ));
  }
}
