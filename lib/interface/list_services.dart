// ignore_for_file: avoid_function_literals_in_foreach_calls, unused_local_variable, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:deogracias/interface/stream_service.dart';
import 'package:deogracias/modele/services.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class ListServices extends StatelessWidget {
  const ListServices({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final serices = Provider.of<List<Services>>(context);
    final provider = Provider.of<Search>(context);
    String value = "";
    bool affiche = false;
    affiche = provider.afficher;
    value = provider.value;

    if (serices.isEmpty) {
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
            "Nos services",
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
                "Nos services",
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
            Services service = serices[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamService(
                                  service_uid: service.uid,
                                  user_uid: service.user_uid)));
                    },
                    title: Text(
                      service.nom,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    leading: service.photo.isEmpty
                        ? CircleAvatar(
                            backgroundColor: Colors.lightBlue.shade900,
                            child: Text(
                              "AP".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : CircleAvatar(
                            child: Image.network(
                              service.photo,
                              scale: 4.5,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                    subtitle: Text(
                      "Créé le " +
                          service.created_at +
                          " à " +
                          service.cretad_at_heure,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : service.nom.toLowerCase().contains(value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamService(
                                      service_uid: service.uid,
                                      user_uid: service.user_uid)));
                        },
                        title: Text(
                          service.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        leading: service.photo.isEmpty
                            ? CircleAvatar(
                                backgroundColor: Colors.lightBlue.shade900,
                                child: Text(
                                  "AP".toUpperCase(),
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : CircleAvatar(
                                child: Image.network(
                                  service.photo,
                                  scale: 4.5,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        subtitle: Text(
                          "Créé le " +
                              service.created_at +
                              " à " +
                              service.cretad_at_heure,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Container();
          },
          itemCount: serices.length,
        ),
      ),
    );
  }
}
