// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/drawer_user.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StatistiqueJournalierUser extends StatelessWidget {
  const StatistiqueJournalierUser({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    Timestamp created = Timestamp.now();
    String date_today = DateFormat("dd-MM-yyyy").format(created.toDate());
    int total_betes = 0;
    int total_oeuf = 0;
    int total_fientes = 0;
    int nombre_betes = 0;
    int montant_bete = 0;
    int nombre_fientes = 0;
    int montant_fientes = 0;
    int totaux = 0;
    int nombre_oeuf = 0;
    int montant_oeuf = 0;
    int nbre_betes = 0;
    int nbre_fientes = 0;
    int nbre_oeuf = 0;
    final ventes_oeuf = Provider.of<List<VenteOeufTables>>(context);
    final ventes_betes = Provider.of<List<VenteBetes>>(context);
    final ventes_fientes = Provider.of<List<VenteFientes>>(context);

    final betes = Provider.of<List<Betes>>(context);
    final oeuf_tables = Provider.of<List<OeufTables>>(context);
    final fientes = Provider.of<List<Fientes>>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    ventes_fientes.forEach((element) {
      if (element.created_at == date_today && element.user_uid == user.uid) {
        nombre_fientes++;
        total_fientes += element.montant;
      }
    });

    ventes_betes.forEach((element) {
      if (element.created_at == date_today && element.user_uid == user.uid) {
        nombre_betes++;
        total_betes += element.montant;
      }
    });

    ventes_oeuf.forEach((element) {
      if (element.created_at == date_today && element.user_uid == user.uid) {
        nombre_oeuf++;
        total_oeuf += element.montant;
      }
    });
    totaux = total_betes + total_fientes + total_oeuf;

    if (nombre_betes <= 0 && nombre_fientes <= 0 && nombre_oeuf <= 0) {
      return Scaffold(
        drawer: DrawerUser(
          vague_uid: vague_uid,
        ),
        backgroundColor: Colors.green.shade800,
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
            "Ventes journalière",
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
      drawer: DrawerUser(
        vague_uid: vague_uid,
      ),
      backgroundColor: Colors.green.shade800,
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
          "Ventes journalières",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
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
              height: 40,
            ),
            Text(
              "Ventes d'aujourd'hui " + date_today,
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
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
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  nombre_betes > 0
                      ? Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue.shade800),
                              width: MediaQuery.of(context).size.width * 0.99,
                              height: 45,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Ventes de betes".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.lightBlue.shade800,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      "bete".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Nombre vendu".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Nombre restant".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Montant".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: betes.map((bete) {
                                    nbre_betes = 0;
                                    montant_bete = 0;

                                    ventes_betes.forEach((element) {
                                      if (element.created_at == date_today &&
                                          element.bete_uid == bete.uid &&
                                          element.user_uid == user.uid) {
                                        nbre_betes += element.nombre;
                                        montant_bete += element.montant;
                                      }
                                    });

                                    return DataRow(cells: [
                                      DataCell(Text(
                                        bete.nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        nbre_betes.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        bete.nombre_restant.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        montant_bete.toString() + " XOF ",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ]);
                                  }).toList()),
                            ),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total de vente de betes :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_betes.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        )
                      : Container(),
                  nombre_fientes > 0
                      ? Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue.shade800),
                              width: MediaQuery.of(context).size.width * 0.99,
                              height: 45,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Vente de fientes".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                    border: TableBorder.all(
                                        color: Colors.lightBlue.shade800,
                                        style: BorderStyle.solid,
                                        width: 3),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        "Fiente".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Nombre vendu".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Nombre restant".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Prix unitaire".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Montant".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ],
                                    rows: fientes.map((fiente) {
                                      nbre_fientes = 0;
                                      montant_fientes = 0;

                                      ventes_fientes.forEach((element) {
                                        if (element.created_at == date_today &&
                                            element.fiente_uid == fiente.uid &&
                                            element.user_uid == user.uid) {
                                          nbre_fientes += element.nombre;
                                          montant_fientes += element.montant;
                                        }
                                      });

                                      return DataRow(cells: [
                                        DataCell(Text(
                                          fiente.nom,
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          nbre_fientes.toString(),
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          fiente.nombre_restant.toString(),
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          fiente.prix_unitaire.toString() +
                                              " XOF",
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          montant_fientes.toString() + " XOF",
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ]);
                                    }).toList())),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total de vente de fientes :"
                                          .toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_fientes.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        )
                      : Container(),
                  nombre_oeuf > 0
                      ? Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue.shade800),
                              width: MediaQuery.of(context).size.width * 0.99,
                              height: 45,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Oeufs de tables".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                    border: TableBorder.all(
                                        color: Colors.lightBlue.shade800,
                                        style: BorderStyle.solid,
                                        width: 3),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        "",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Nombre vendu".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Nombre restant".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Prix unitaire".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Montant total".toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ],
                                    rows: oeuf_tables.map((oeuf) {
                                      nbre_oeuf = 0;
                                      montant_oeuf = 0;

                                      ventes_oeuf.forEach((element) {
                                        if (element.created_at == date_today &&
                                            oeuf.uid == element.oeuf_uid &&
                                            element.user_uid == user.uid) {
                                          nbre_oeuf += element.nombre;
                                          montant_oeuf += element.montant;
                                        }
                                      });

                                      return DataRow(cells: [
                                        DataCell(Text(
                                          oeuf.nom,
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          nbre_oeuf.toString(),
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          oeuf.nombre_restant.toString(),
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          oeuf.prix_unitaire.toString() +
                                              " XOF",
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          montant_oeuf.toString() + "  XOF",
                                          style: GoogleFonts.alike(
                                              color: Colors.lightBlue.shade800,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ]);
                                    }).toList())),
                          ],
                        )
                      : Container(),
                  Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width * 0.999,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade900,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Total de vente :".toUpperCase(),
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            totaux.toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
