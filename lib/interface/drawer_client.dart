// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, non_constant_identifier_names, prefer_final_fields, unused_field, use_build_context_synchronously
import 'package:deogracias/interface/a_propos_de_nous.dart';
import 'package:deogracias/interface/accueil.dart';
import 'package:deogracias/interface/apprecier_notre_service.dart';
import 'package:deogracias/interface/besoin_daide.dart';
import 'package:deogracias/interface/commander.dart';
import 'package:deogracias/interface/consulter_listes_des_commandes_par_le_client.dart';
import 'package:deogracias/provider/provider_drawer_client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerClient extends StatelessWidget {
  DrawerClient({super.key});

  bool _home = true;
  bool commande = false;
  bool apprecier = false;
  bool list_commande = false;
  bool apropos = false;
  bool besoin_aide = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderDrawerClient>(context);
    _home = provider.home;
    commande = provider.commande;
    list_commande = provider.list_commande;
    apprecier = provider.apprecier;
    apropos = provider.apropos;
    besoin_aide = provider.besoin_aide;
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
                          "Agri PILALO",
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
                  provider.accueil();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contextb) => Accueil()));
                },
                title: Text(
                  "Home",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: commande ? Colors.lightBlue.shade900 : null,
                textColor: commande ? Colors.white : Colors.black,
                onTap: () {
                  provider.passer_commande();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contextb) => Commande()));
                },
                title: Text(
                  "Passer une commande",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: list_commande ? Colors.lightBlue.shade900 : null,
                textColor: list_commande ? Colors.white : Colors.black,
                onTap: () {
                  provider.list_des_commandes();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => ListeDesCommandesDuClient()));
                },
                title: Text(
                  "Liste des commandes passées",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: apprecier ? Colors.lightBlue.shade900 : null,
                textColor: apprecier ? Colors.white : Colors.black,
                onTap: () {
                  provider.apprecier_commande();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => ApprecierNosServices()));
                },
                title: Text(
                  "Apprécier nos services de prestations",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: apropos ? Colors.lightBlue.shade900 : null,
                textColor: apropos ? Colors.white : Colors.black,
                onTap: () {
                  provider.aproposdenous();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (contextb) => AProposDeNous()));
                },
                title: Text(
                  "Qui sommes nous?",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                tileColor: besoin_aide ? Colors.lightBlue.shade900 : null,
                textColor: besoin_aide ? Colors.white : Colors.black,
                onTap: () {
                  provider.besoindaide();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contextb) => BesoinDAide()));
                },
                title: Text(
                  "Besoin d'aide ? ",
                  style: GoogleFonts.alike(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
