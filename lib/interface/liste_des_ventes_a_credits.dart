// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:deogracias/interface/stream_vente_a_credit.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/modele/ventes_a_credits.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class ListeDesVentesACredits extends StatefulWidget {
  ListeDesVentesACredits({super.key});

  @override
  State<ListeDesVentesACredits> createState() => _ListeDesVentesACreditsState();
}

class _ListeDesVentesACreditsState extends State<ListeDesVentesACredits> {
  bool affiche = false;

  String value = "";

  @override
  Widget build(BuildContext context) {
    final ventes_a_credits = Provider.of<List<VentesACredits>>(context);
    final provider = Provider.of<Search>(context);
    affiche = provider.afficher;
    value = provider.value;

    if (ventes_a_credits.isEmpty) {
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
              "Ventes à crédit",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          body: Center(child: CircularProgressIndicator(color: Colors.white)));
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
                "Ventes à crédits",
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
            VentesACredits vente_a_credit = ventes_a_credits[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamVenteACredit(
                                  vague_uid: vague.uid,
                                  vente_a_credit_uid: vente_a_credit.uid,
                                  vente_a_credit_user_uid:
                                      vente_a_credit.user_uid)));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade900,
                      child: Text(
                        vente_a_credit.nom_client.substring(0, 2).toUpperCase(),
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      vente_a_credit.nom_client,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Effectué le : " +
                        vente_a_credit.created_at +
                        " à " +
                        vente_a_credit.created_at_heure),
                  )
                : vente_a_credit.nom_client
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        vente_a_credit.achat_effectue
                            .toLowerCase()
                            .contains(value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamVenteACredit(
                                      vague_uid: vague.uid,
                                      vente_a_credit_uid: vente_a_credit.uid,
                                      vente_a_credit_user_uid:
                                          vente_a_credit.user_uid)));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            vente_a_credit.nom_client
                                .substring(0, 2)
                                .toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          vente_a_credit.nom_client,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Effectué le : " +
                            vente_a_credit.created_at +
                            " à " +
                            vente_a_credit.created_at_heure),
                      )
                    : Container();
          },
          itemCount: ventes_a_credits.length,
        ),
      ),
    );
  }
}
