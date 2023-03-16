// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, prefer_const_constructors, unnecessary_this, prefer_interpolation_to_compose_strings

import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoriqueIntervalle extends StatelessWidget {
  const HistoriqueIntervalle({
    super.key,
    required this.premiere_date_in_milli,
    required this.deuxieme_date_in_milli,
    required this.premiere_date,
    required this.deuxieme_date,
    required this.vague_uid,
  });
  final int premiere_date_in_milli;
  final int deuxieme_date_in_milli;
  final String premiere_date;
  final String deuxieme_date;
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    final list_vente_betes = Provider.of<List<VenteBetes>>(context);
    final list_vente_fientes = Provider.of<List<VenteFientes>>(context);
    final list_vente_oeuf = Provider.of<List<VenteOeufTables>>(context);
    final betes = Provider.of<List<Betes>>(context);
    final fientes = Provider.of<List<Fientes>>(context);
    final oeuf_tables = Provider.of<List<OeufTables>>(context);
    int nombre_bete = 0;
    int montant_bete = 0;
    int total_bete = 0;
    int nombre_oeuf = 0;
    int montant_oeuf = 0;
    int total_oeuf = 0;
    int nombre_fiente = 0;
    int montant_fiente = 0;
    int total_fient = 0;
    int totaux = 0;
    int nbre_bete = 0;
    int nbre_oeuf = 0;
    int nbre_fiente = 0;

    list_vente_oeuf.forEach((element) {
      if (element.created_at_in_days >= premiere_date_in_milli &&
          element.created_at_in_days <= deuxieme_date_in_milli) {
        nombre_oeuf++;
        total_oeuf += element.montant;
      }
    });

    list_vente_betes.forEach((element) {
      if (element.created_at_in_days >= premiere_date_in_milli &&
          element.created_at_in_days <= deuxieme_date_in_milli) {
        nombre_bete++;
        total_bete += element.montant;
      }
    });

    list_vente_fientes.forEach((element) {
      if (element.created_at_in_days >= premiere_date_in_milli &&
          element.created_at_in_days <= deuxieme_date_in_milli) {
        nombre_fiente++;
        total_fient += element.montant;
      }
    });

    totaux = total_fient + total_oeuf + total_bete;

    if (nombre_fiente <= 0 && nombre_oeuf <= 0 && nombre_bete <= 0) {
      return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerVagueAdmin(vague_uid: vague_uid),
        appBar: AppBar(
          actions: [
            Image.asset(
              "images/icon2.jpg",
              scale: 4.5,
              height: 100,
              width: 100,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Historique de vente",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
        backgroundColor: Colors.green.shade800,
        drawer: DrawerVagueAdmin(vague_uid: vague_uid),
        appBar: AppBar(
          actions: [
            Image.asset(
              "images/icon2.jpg",
              scale: 4.5,
              height: 100,
              width: 100,
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Historique de vente",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
                height: 40,
              ),
              Text(
                "Ventes éffectuées entre " +
                    premiere_date +
                    " et " +
                    deuxieme_date,
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
                height: 60,
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
                width: MediaQuery.of(context).size.width * 0.97,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    nombre_bete > 0
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
                                      nbre_bete = 0;
                                      montant_bete = 0;

                                      list_vente_betes.forEach((element) {
                                        if (element.created_at_in_days >= premiere_date_in_milli &&
                                            element.created_at_in_days <=
                                                deuxieme_date_in_milli &&
                                            element.bete_uid == bete.uid) {
                                          nbre_bete += element.nombre;
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
                                          nbre_bete.toString(),
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
                                width:
                                    MediaQuery.of(context).size.width * 0.999,
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
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Total de vente de betes :"
                                            .toUpperCase(),
                                        style: GoogleFonts.alike(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Text(
                                        total_bete.toString() + " XOF",
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
                    nombre_fiente > 0
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
                                        nbre_fiente = 0;
                                        montant_fiente = 0;

                                        list_vente_fientes.forEach((element) {
                                          if (element.created_at_in_days >= premiere_date_in_milli &&
                                              element.created_at_in_days <=
                                                  deuxieme_date_in_milli &&
                                              element.fiente_uid ==
                                                  fiente.uid) {
                                            nbre_fiente += element.nombre;
                                            montant_fiente += element.montant;
                                          }
                                        });

                                        return DataRow(cells: [
                                          DataCell(Text(
                                            fiente.nom,
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            nbre_fiente.toString(),
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            fiente.nombre_restant.toString(),
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            fiente.prix_unitaire.toString() +
                                                " XOF",
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            montant_fiente.toString() + " XOF",
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ]);
                                      }).toList())),
                              Container(
                                height: 47,
                                width:
                                    MediaQuery.of(context).size.width * 0.999,
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
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
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
                                        total_fient.toString() + " XOF",
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

                                        list_vente_oeuf.forEach((element) {
                                          if (element.created_at_in_days >= premiere_date_in_milli &&
                                              element.created_at_in_days <=
                                                  deuxieme_date_in_milli &&
                                              oeuf.uid == element.oeuf_uid) {
                                            nbre_oeuf += element.nombre;
                                            montant_oeuf += element.montant;
                                          }
                                        });

                                        return DataRow(cells: [
                                          DataCell(Text(
                                            oeuf.nom,
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            nbre_oeuf.toString(),
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            oeuf.nombre_restant.toString(),
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            oeuf.prix_unitaire.toString() +
                                                " XOF",
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataCell(Text(
                                            montant_oeuf.toString() + "  XOF",
                                            style: GoogleFonts.alike(
                                                color:
                                                    Colors.lightBlue.shade800,
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
        ));
  }
}
