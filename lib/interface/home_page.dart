// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:deogracias/interface/drawer_user.dart';
import 'package:deogracias/interface/enregistrer_depense_user.dart';
import 'package:deogracias/interface/enregistrer_un_probleme.dart';
import 'package:deogracias/interface/enregistrer_une_perte_user.dart';
import 'package:deogracias/interface/enregistrer_vente_a_credit_user.dart';
import 'package:deogracias/interface/list_des_ventes_a_credit_non_payes_user.dart';
import 'package:deogracias/interface/new_password_user.dart';
import 'package:deogracias/interface/profil_user.dart';
import 'package:deogracias/interface/statistique_journaliere_user.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    Future<bool> ShowExitApp() async {
      return await showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: Text(
                    "Agri PIYALO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  content: Text(
                    "Voulez vous vraiment quitter cette application ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade900),
                            onPressed: (() {
                              Navigator.of(context).pop(true);
                            }),
                            child: Text(
                              "Confirmer",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: (() {
                              Navigator.of(context).pop(false);
                            }),
                            child: Text(
                              "Annuler",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              })) ??
          false;
    }

    return WillPopScope(
        onWillPop: ShowExitApp,
        child: Scaffold(
          drawer: DrawerUser(),
          backgroundColor: Colors.green.shade800,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Agri Piyalo",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            centerTitle: true,
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
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage(
                            "images/image2.jpeg",
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Bonjour, " + user.prenom + " !",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                user.role.isEmpty
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.brown.shade800,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              user.role,
                              style: GoogleFonts.alike(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.96,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: [
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
                                "Personnalisez vos privilèges",
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
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilUser(),
                                    ));
                              },
                              child: Text(
                                "Profil",
                                style: GoogleFonts.alike(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 5,
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
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StatistiqueJournalierUser(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Statistique journalière de vente",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EnregisterUneVenteAcreditUser(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Enregister une vente à crédit",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VentesACreditsNonPayesUser(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Ventes à crédits non payés",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EnregistrerPerteUser(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Enregister une perte",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EnregisterDepenseUser(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Enregister une dépense",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EnregistrerProbleme(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Signaler un problème",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 15, bottom: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewPasswordUser(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Expanded(
                                  child: Text(
                                    "Mot de passe",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: GoogleFonts.alike(
                                        color: Colors.lightBlue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
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
                        height: 40,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ));
  }
}
