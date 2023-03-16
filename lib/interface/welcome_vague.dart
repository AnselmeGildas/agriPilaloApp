// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/interface/enregister_une_vente_a_credit.dart';
import 'package:deogracias/interface/stream_historique_vente_fiente.dart';
import 'package:deogracias/interface/stream_vague_achat_poussins_effectues.dart';
import 'package:deogracias/interface/stream_vague_enregistrer_depense.dart';
import 'package:deogracias/interface/stream_vague_enregistrer_perte.dart';
import 'package:deogracias/interface/stream_vague_historique_vente_betes.dart';
import 'package:deogracias/interface/stream_vague_historique_vente_oeuf_tables.dart';
import 'package:deogracias/interface/stream_vague_list_des_ventes_a_credits_non_payes.dart';
import 'package:deogracias/interface/stream_vague_list_vente_a_credit.dart';
import 'package:deogracias/interface/stream_vague_signaler_bete_morts_retablies.dart';
import 'package:deogracias/interface/stream_vague_signaler_poussin_mort_etablie.dart';
import 'package:deogracias/interface/stream_vague_ventes_a_credits_non_payes.dart';
import 'package:deogracias/modele/budget_tiers.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeVague extends StatelessWidget {
  WelcomeVague({super.key});

  int benefice = 0;

  int depense = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<BudgetTiers>(context);
    final vague = Provider.of<Vagues>(context);
    depense = budget.depense + budget.perte;
    if (budget.solde_total > depense) {
      benefice = budget.solde_total - depense;
    } else {
      benefice = 0;
    }
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerVagueAdmin(vague_uid: vague.uid),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Agri Pilalo",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          Image.asset(
            "images/icon2.jpg",
            height: 70,
            width: 70,
            scale: 4.5,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/image8.jfif",
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  vague.nom + " !",
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.lightBlue.shade900)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Solde actuel",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      budget.solde_total.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 60,
                              color: Colors.lightBlue.shade900,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bénéfice brute",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      benefice.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: Colors.lightBlue.shade900)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dépenses",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      budget.depense.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 60,
                              color: Colors.lightBlue.shade900,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pertes",
                                  style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      budget.perte.toString(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "XOF".toUpperCase(),
                                      style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      height: 45,
                      alignment: Alignment.center,
                      color: Colors.lightBlue.shade900,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Autres options",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.rule_sharp,
                            color: Colors.white,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 15, bottom: 10),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueHistoriqueVenteFiente(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Historique de ventes de fiente",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 15, bottom: 10),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueHistoriqueVentesBetes(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Historique de vente de bete",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 15, bottom: 10),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueHistoriqueVenteOeufTables(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Historique des vebtes d'oeufs de tables  ",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueAchatPoussinsEffectues(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Achats de poussins éffectués",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueSignalerPOussinMortRetablie(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Expanded(
                              child: Text(
                                "Signaler de poussins rétablis ou mort ayant été malades",
                                maxLines: 3,
                                softWrap: true,
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueSignalerBeteMortsRetablie(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Expanded(
                              child: Text(
                                "Signaler de betes mortes ou rétablies ayant été malade",
                                maxLines: 3,
                                softWrap: true,
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnregisterUneVenteAcredit(
                                  vague_uid: vague.uid,
                                ),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Enregister une vente à crédit",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueEnregistrerPerte(
                                  vague_uid: vague.uid,
                                ),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Enregister une perte",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StreamVagueEnregistrerDepense(
                                        vague_uid: vague.uid,
                                      )));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Enregister une dépense",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueListVenteACredit(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Ventes à crédits éffectuées",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueListDesVentesACreditsNonPayes(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Ventes à crédits non payées",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamVagueVentesACreditsPayes(
                                        vague_uid: vague.uid),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Ventes à crédit déjà payés",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.lightBlue.shade900,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
