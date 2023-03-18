// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, non_constant_identifier_names, prefer_final_fields, unused_field, use_build_context_synchronously

import 'package:deogracias/interface/appreciations.dart';
import 'package:deogracias/interface/connexion.dart';
import 'package:deogracias/interface/list_des_vagues.dart';
import 'package:deogracias/interface/liste_des_clients.dart';
import 'package:deogracias/interface/commandes_journalieres.dart';
import 'package:deogracias/interface/vagues.dart';
import 'package:deogracias/interface/vagues_clotures.dart';
import 'package:deogracias/interface/welcome_admin.dart';
import 'package:deogracias/provider/provider_drawer_admin.dart';
import 'package:deogracias/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerAdmin extends StatelessWidget {
  DrawerAdmin({super.key});

  bool _home = true;
  bool _commandes_journaliere = false;
  bool _toutes_commandes = false;
  bool _vagues = false;
  bool _list_vagues = false;
  bool _vagues_clotures = false;
  bool _appreciation = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderDrawerAdmin>(context);
    _home = provider.home;
    _commandes_journaliere = provider.commandes_journalieres;
    _toutes_commandes = provider.commandes;
    _list_vagues = provider.list_vagues;
    _vagues = provider.vagues;
    _vagues_clotures = provider.vagues_clotures;
    _appreciation = provider.appreciation;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: DrawerHeader(
                    child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    user.photo_url.isEmpty
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: Image.asset(
                                'images/icon2.jpg',
                                width: 120,
                                height: 120,
                                scale: 2.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: NetworkImage(user.photo_url),
                                    fit: BoxFit.cover,
                                    scale: 2.5)),
                          ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          user.prenom + " " + user.nom,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )),
              ),
              ListTile(
                tileColor: _home ? Colors.lightBlue.shade900 : null,
                textColor: _home ? Colors.white : Colors.black,
                onTap: () {
                  provider.change_home();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contextb) => AccueilAdmin()));
                },
                title: Text(
                  "Home",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.change_vagues();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LesVagues()));
                },
                tileColor: _vagues ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Vagues",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.change_commande_journaliere();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommandesJournalieres()));
                },
                tileColor:
                    _commandes_journaliere ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Commandes de la journée",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.change_commandes();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListeClients()));
                },
                tileColor: _toutes_commandes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des clients",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.change_vagues_clotures();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VaguesClotures()));
                },
                tileColor: _vagues_clotures ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Vagues clôturées",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.change_list_vagues();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListVagues()));
                },
                tileColor: _list_vagues ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des vagues",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.change_appreciation();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppreciationsClients()));
                },
                tileColor: _appreciation ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Appréciations des clients",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  _speak("Vous devriez d'abord confirmé");
                  _showMyDialog(context);
                },
                textColor: Colors.redAccent,
                title: Text(
                  "Déconnexion",
                  style: GoogleFonts.alike(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(
  BuildContext context,
) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Etes vous sur ?".toUpperCase()),
          content: SingleChildScrollView(
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("Voudriez vous déconnecter ?"),
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
                          await FirebaseAuth.instance.signOut();
                          _speak("Vous avez été déconnecté");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Login())));

                          // ignore: empty_catches
                        } catch (e) {
                          _speak("Une erreur inattendue s'est produite");
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
                        _speak("Deconnexion annulée");
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
      });
}

Future _speak(String text) async {
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
