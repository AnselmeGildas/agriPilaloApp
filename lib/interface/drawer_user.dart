// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, non_constant_identifier_names, prefer_final_fields, unused_field, use_build_context_synchronously

import 'package:deogracias/interface/enregistrer_vente_a_credit_user.dart';
import 'package:deogracias/interface/home_page.dart';
import 'package:deogracias/interface/stream_signaler_betes_morts_retablies_user.dart';
import 'package:deogracias/interface/stream_vague_enregistrer_depense_user.dart';
import 'package:deogracias/interface/stream_vague_enregistrer_perte_user.dart';
import 'package:deogracias/interface/stream_vague_recharger_betes_user.dart';
import 'package:deogracias/interface/stream_vague_recharger_fientes_user.dart';
import 'package:deogracias/interface/stream_vague_recharger_oeuf_user.dart';
import 'package:deogracias/interface/stream_vague_signaler_oeuf_user.dart';
import 'package:deogracias/interface/stream_vague_signaler_poussin_mort_retablie_user.dart';
import 'package:deogracias/interface/stream_vague_signaler_poussin_user.dart';
import 'package:deogracias/interface/stream_vague_statistique_journalir_user.dart';
import 'package:deogracias/interface/stream_vague_vente_oeuf_table_user.dart';
import 'package:deogracias/interface/stream_vague_ventes_betes_user.dart';
import 'package:deogracias/interface/stream_vague_ventes_fientes_user.dart';
import 'package:deogracias/interface/stream_vagues_list_ventes_a_credits_non_payes.dart';
import 'package:deogracias/interface/stream_vagues_signaler_betes_user.dart';
import 'package:deogracias/provider/provider_drawer_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'connexion.dart';

class DrawerUser extends StatelessWidget {
  DrawerUser({super.key, required this.vague_uid});
  final String vague_uid;
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
  bool statistique_journalier = false;
  bool enregistrer_vente_a_credit = false;
  bool ventes_a_credits = false;
  bool enregistrer_perte = false;
  bool enregistrer_depense = false;
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
    statistique_journalier = provider.statistique_journalier;
    enregistrer_vente_a_credit = provider.enregistrer_vente;
    ventes_a_credits = provider.ventes_a_credits;
    enregistrer_depense = provider.enregistrer_depense;
    enregistrer_perte = provider.enregistrer_perte;
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
                          "Agripilayo",
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
              ListTile(
                tileColor: vente_oeuf ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_vente_oeuf();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => StreamVagueVenteOeufTableUser(
                              vague_uid: vague_uid)));
                },
                title: Text(
                  "Ventes d'oeuf de tables",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: vente_bete ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_vente_bete();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => StreamVagueVentesBetesUser(
                              vague_uid: vague_uid)));
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
                          builder: (contextb) => StreamVagueVentesFientesUser(
                              vague_uid: vague_uid)));
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
                          builder: (contextb) => StreamVagueRechargerOeufUser(
                              vague_uid: vague_uid)));
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
                          builder: (contextb) => StreamVagueRechargerBetesUser(
                              vague_uid: vague_uid)));
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
                          builder: (contextb) =>
                              StreamVagueStockRechargerFientesUser(
                                  vague_uid: vague_uid)));
                },
                title: Text(
                  "Récharger le stock de fiente",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor:
                    statistique_journalier ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_statistique_journalier();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) =>
                              StreamVagueStatistiqueJournalierUser(
                                  vague_uid: vague_uid)));
                },
                title: Text(
                  "Statistique journalière",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: enregistrer_vente_a_credit
                    ? Colors.lightBlue.shade900
                    : null,
                onTap: () {
                  provider.change_enregistrer_vente_a_credit();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => EnregisterUneVenteAcreditUser(
                              vague_uid: vague_uid)));
                },
                title: Text(
                  "Enregister une vente à crédits",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: ventes_a_credits ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_ventes_a_credits();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) =>
                              StreamVagueListDesVentesACreditsNonPayesUser(
                                  vague_uid: vague_uid)));
                },
                title: Text(
                  "Ventes à crédits non payés",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor:
                    enregistrer_depense ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_enregistrer_depense();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) =>
                              StreamVagueEnregistrerDepenseUser(
                                  vague_uid: vague_uid)));
                },
                title: Text(
                  "Enregister une depense",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: enregistrer_perte ? Colors.lightBlue.shade900 : null,
                onTap: () {
                  provider.change_enregistrer_perte();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) =>
                              StreamVagueEnregistrerPerteUser(
                                  vague_uid: vague_uid)));
                },
                title: Text(
                  "Enregister une perte",
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
                          builder: (contextb) => StreamVagueSignalerPoussinUser(
                              vague_uid: vague_uid)));
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
                          builder: (contextb) => StreamVagueSignalerBetesUser(
                              vague_uid: vague_uid)));
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
                          builder: (contextb) => StreamVagueSignalerOeufUser(
                              vague_uid: vague_uid)));
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
                              StreamVagueSignalerBetesMortsRetablieUser(
                                  vague_uid: vague_uid)));
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
                              StreamVagueSignalerPOussinMortRetablieUser(
                                  vague_uid: vague_uid)));
                },
                title: Text(
                  "Signaler un poussin rétabli ou mort ayant été malade",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
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
