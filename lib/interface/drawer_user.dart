// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, non_constant_identifier_names, prefer_final_fields, unused_field, use_build_context_synchronously

import 'package:deogracias/interface/home_page.dart';
import 'package:deogracias/interface/signaler_betes_morts_retablie_user.dart';
import 'package:deogracias/interface/signaler_betes_user.dart';
import 'package:deogracias/interface/signaler_oeuf_gate_user.dart';
import 'package:deogracias/interface/signaler_poussin_mort_retzablie_user.dart';
import 'package:deogracias/interface/signaler_poussin_user.dart';
import 'package:deogracias/interface/stock_fientes_user.dart';
import 'package:deogracias/interface/stock_oeufs_user.dart';
import 'package:deogracias/interface/stocks_betes_user.dart';
import 'package:deogracias/interface/ventes_betes_user.dart';
import 'package:deogracias/interface/ventes_des_fientes_user.dart';
import 'package:deogracias/provider/provider_drawer_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'connexion.dart';

class DrawerUser extends StatelessWidget {
  DrawerUser({super.key});

  bool home = true;
  bool vente_oeuf = false;
  bool vente_bete = false;
  bool vente_fiente = false;
  bool signaler_oeuf = false;
  bool signaler_bete = false;
  bool signaler_poussin = false;
  bool signaler_poussin_retablie = false;
  bool signaler_bete_retablie = false;
  bool recharger_oeuf = false;
  bool recharger_bete = false;
  bool recharger_fiente = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderDrawerUser>(context);
    home = provider.home;
    vente_bete = provider.vente_bete;
    vente_fiente = provider.vente_fiente;
    vente_oeuf = provider.vente_oeuf;
    signaler_bete = provider.signaler_bete;
    signaler_oeuf = provider.signaler_oeuf;
    signaler_poussin = provider.signaler_poussin;
    signaler_bete_retablie = provider.signaler_bete_retablie;
    signaler_poussin_retablie = provider.signaler_poussin_retablie;
    recharger_bete = provider.recharger_bete;
    recharger_fiente = provider.recharger_fiente;
    recharger_oeuf = provider.recharger_oeuf;
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
                    Padding(
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
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "Agri PIYALO",
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
                tileColor: home ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_home();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contextb) => HomePage()));
                },
                title: Text(
                  "Home",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              /*ListTile(
                tileColor: vente_oeuf ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_vente_oeuf();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => VenteOeufTableUser()));
                },-*
                title: Text(
                  "Ventes d'oeuf de tables",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),*/
              ListTile(
                tileColor: vente_bete ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_vente_bete();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => VenteDesBetesUser()));
                },
                title: Text(
                  "Ventes de betes",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: vente_fiente ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_vente_fiente();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => VenteDeFientesUser()));
                },
                title: Text(
                  "Vente de fientes",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: recharger_oeuf ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_recharger_eouf();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => StockOeufsUser()));
                },
                title: Text(
                  "Récharger le stock d'oeuf de tables",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: recharger_bete ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_recharger_bete();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => StockBetesUser()));
                },
                title: Text(
                  "Récharger le stock de bete",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: recharger_fiente ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_recharger_fiente();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => StockFientesUser()));
                },
                title: Text(
                  "Récharger le stock de fiente",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: signaler_poussin ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_signaler_poussin();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => SignalerPoussinUser()));
                },
                title: Text(
                  "Signaler un poussin",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: signaler_bete ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_signaler_bete();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => SignalerBetesUser()));
                },
                title: Text(
                  "Signaler une bete",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: signaler_oeuf ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_signaler_oeuf();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => SignalerOeufCasseUser()));
                },
                title: Text(
                  "Signaler un oeuf cassé",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor:
                    signaler_bete_retablie ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_signaler_bete_retablie();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) =>
                              SignalerBetesMortRetablieUser()));
                },
                title: Text(
                  "Signaler une bete rétablie ou morte ayant été malade",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: signaler_poussin_retablie
                    ? Colors.lightBlue.shade900
                    : null,
                onTap: () {
                  provider.change_signaler_poussin_retablie();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) =>
                              SignalerPoussinMortRetabliUser()));
                },
                title: Text(
                  "Signaler un poussin rétabli ou mort ayant été malade",
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
                          Navigator.of(context).pop();
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
