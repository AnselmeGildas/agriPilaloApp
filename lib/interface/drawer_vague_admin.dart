// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, non_constant_identifier_names, prefer_final_fields, unused_field, use_build_context_synchronously

import 'package:deogracias/interface/achat_poussin.dart';
import 'package:deogracias/interface/connexion.dart';
import 'package:deogracias/interface/enregister_depense.dart';
import 'package:deogracias/interface/enregister_perte.dart';
import 'package:deogracias/interface/historique_vente.dart';
import 'package:deogracias/interface/list_betes.dart';
import 'package:deogracias/interface/liste_depense.dart';
import 'package:deogracias/interface/liste_perte.dart';
import 'package:deogracias/interface/rubrique_stock.dart';
import 'package:deogracias/interface/signaler_betes.dart';
import 'package:deogracias/interface/signaler_oeuf_gate.dart';
import 'package:deogracias/interface/signaler_poussin.dart';
import 'package:deogracias/interface/statistique_journaliere.dart';
import 'package:deogracias/interface/stock_fientes.dart';
import 'package:deogracias/interface/stock_oeufs.dart';
import 'package:deogracias/interface/stocks_betes.dart';
import 'package:deogracias/interface/vente_fiente.dart';
import 'package:deogracias/interface/ventes_betes.dart';
import 'package:deogracias/interface/ventes_oeufs_table.dart';
import 'package:deogracias/interface/welcome_admin.dart';
import 'package:deogracias/provider/provider_vague_admin.dart';
import 'package:deogracias/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/nouvelle_bete.dart';

class DrawerVagueAdmin extends StatelessWidget {
  DrawerVagueAdmin({super.key});

  bool _home = true;
  bool _statistique_journalier = false;
  bool _statistique_generale = false;
  bool _rubrique = false;
  bool _historique = false;
  bool vagues = false;
  bool _vente_betes = false;
  bool _vente_fiente = false;
  bool _ventes_oeufs_table = false;
  bool _enregister_depense = false;
  bool _enregister_perte = false;
  bool _nouvelle_bete = false;
  bool _stock_oeufs = false;
  bool _stock_betes = false;
  bool _stock_fiante = false;
  bool _achat_poussin = false;
  bool _poussin_malade = false;
  bool _bete_malade = false;
  bool _liste_betes = false;
  bool _liste_depenses = false;
  bool _liste_pertes = false;
  bool _signaler_oeuf_casse = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderVagueAdmin>(context);
    _home = provider.home;
    _statistique_journalier = provider.statistique_journalier;
    _rubrique = provider.rubrique;
    _historique = provider.historique;
    _vente_betes = provider.ventes_betes;
    _vente_fiente = provider.ventes_fiantes;
    _ventes_oeufs_table = provider.venets_oeufs_table;
    _enregister_depense = provider.enregister_depense;
    _enregister_perte = provider.enregister_perte;
    _nouvelle_bete = provider.nouvelle_betes;
    vagues = provider.vagues;
    _stock_oeufs = provider.stock_oeufs_table;
    _stock_betes = provider.stock_betes;
    _stock_fiante = provider.stock_fientes;
    _achat_poussin = provider.achat_poussion;
    _poussin_malade = provider.poussin_malade;
    _bete_malade = provider.bete_malade;
    _liste_betes = provider.listes_betes;
    _liste_depenses = provider.liste_depense;
    _liste_pertes = provider.liste_perte;
    _signaler_oeuf_casse = provider.oeufs_casse;

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
                  provider.home_true();
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
                  provider.vague_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RubriqueStocks()));
                },
                tileColor: vagues ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Vagues",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.rubrique_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RubriqueStocks()));
                },
                tileColor: _rubrique ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Rubrique des stocks",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.statistique_journalier_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StatistiqueJournaliere()));
                },
                tileColor:
                    _statistique_journalier ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Statistique journalière de vente",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.historique_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoriqueVente()));
                },
                tileColor: _historique ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Historique des ventes",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.ventes_betes_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VenteDesBetes()));
                },
                tileColor: _vente_betes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Ventes de betes",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.ventes_fiantes_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VenteDeFientes()));
                },
                tileColor: _vente_fiente ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Ventes de fiente",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.ventes_oeufs_table_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VenteOeufTable()));
                },
                tileColor:
                    _ventes_oeufs_table ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Ventes de oeufs de table",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.enregister_depense_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnregisterDepense()));
                },
                tileColor:
                    _enregister_depense ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Enregister une dépense",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.enregister_perte_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnregistrerPerte()));
                },
                tileColor: _enregister_perte ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Enregister une perte",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.nouvelle_bete_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NouvelleBete()));
                },
                tileColor: _nouvelle_bete ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Nouvelle bete",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.stock_betes_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StockBetes()));
                },
                tileColor: _stock_betes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Récharger le stock de betes",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.stock_oeufs_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StockOeufs()));
                },
                tileColor: _stock_oeufs ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Récharger le stock des oeufs de table",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.stock_fientes_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StockFientes()));
                },
                tileColor: _stock_fiante ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Récharger le stock de fiante",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.achat_poussin_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AchatPoussin()));
                },
                tileColor: _achat_poussin ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Achat de poussins d'une journée",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.poussin_malade_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignalerPoussin()));
                },
                tileColor: _poussin_malade ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Signaler un poussin",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.bete_malade_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignalerBetes()));
                },
                tileColor: _bete_malade ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Signaler une bete ",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.signaler_oeuf_casse_true();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignalerOeufCasse()));
                },
                tileColor:
                    _signaler_oeuf_casse ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Signaler un oeuf cassé ou gaté",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.liste_betes_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListeBetes()));
                },
                tileColor: _liste_betes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des betes",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.liste_depense_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListeDepense()));
                },
                tileColor: _liste_depenses ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "liste des dépenses",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.liste_perte_true();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListePerte()));
                },
                tileColor: _liste_pertes ? Colors.lightBlue.shade900 : null,
                title: Text(
                  "Liste des pertes",
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
