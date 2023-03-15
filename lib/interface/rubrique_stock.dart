// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_element, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls

import 'package:deogracias/interface/drawer_admin.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/poussins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RubriqueStocks extends StatefulWidget {
  RubriqueStocks({super.key});

  @override
  State<RubriqueStocks> createState() => _RubriqueStocksState();
}

class _RubriqueStocksState extends State<RubriqueStocks> {
  int total_betes = 0;
  int total_fientes = 0;
  int total_oeufs = 0;
  int totaux = 0;

  @override
  Widget build(BuildContext context) {
    final betes = Provider.of<List<Betes>>(context);
    final fientes = Provider.of<List<Fientes>>(context);
    final poussins = Provider.of<List<PoussinsUnJour>>(context);
    final oeufs_tables = Provider.of<List<OeufTables>>(context);

    betes.forEach((element) {
      total_betes += element.montant_vendu;
    });

    fientes.forEach((element) {
      total_fientes += element.montant_vendu;
    });

    oeufs_tables.forEach((element) {
      total_oeufs += element.montant_vendu;
    });

    totaux = total_betes + total_fientes + total_oeufs;

    if (fientes.isEmpty &&
        betes.isEmpty &&
        poussins.isEmpty &&
        oeufs_tables.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.green.shade800,
        drawer: DrawerAdmin(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
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
            "Rubrique des stocks",
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
      drawer: DrawerAdmin(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
          "Rubrique des stocks",
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
              "Rubrique des stocks",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue.shade800),
                    width: MediaQuery.of(context).size.width * 0.99,
                    height: 45,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Betes".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                            "Nombre initial".toUpperCase(),
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
                            "Montant total".toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Nombre malade".toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Nombre perdu(mort)".toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                        rows: betes.map((bete) {
                          return DataRow(cells: [
                            DataCell(Text(
                              bete.nom,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataCell(Text(
                              bete.nombre_initial.toString(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataCell(Text(
                              (bete.nombre_initial - bete.nombre_restant)
                                  .toString(),
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
                              bete.montant_vendu.toString() + " XOF",
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataCell(Text(
                              bete.nombre_malade.toString(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataCell(Text(
                              bete.nombre_mort.toString(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ))
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue.shade800),
                    width: MediaQuery.of(context).size.width * 0.99,
                    height: 45,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Fientes".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                              "Nombre initial".toUpperCase(),
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
                            ))
                          ],
                          rows: fientes.map((fiente) {
                            return DataRow(cells: [
                              DataCell(Text(
                                fiente.nom,
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                fiente.nombre_initial.toString(),
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                (fiente.nombre_initial - fiente.nombre_restant)
                                    .toString(),
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
                                fiente.prix_unitaire.toString() + " XOF",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                fiente.montant_vendu.toString() + " XOF",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              ))
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Total de vente de fientes :".toUpperCase(),
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
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                              "Stock initial".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "Stock vendu".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              "Stock restant".toUpperCase(),
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
                            DataColumn(
                                label: Text(
                              "Nombre cassé".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ))
                          ],
                          rows: oeufs_tables.map((oeuf) {
                            return DataRow(cells: [
                              DataCell(Text(
                                oeuf.nom,
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                oeuf.nombre_initial.toString(),
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                (oeuf.nombre_initial - oeuf.nombre_restant)
                                    .toString(),
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
                                oeuf.prix_unitaire.toString() + "  XOF",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                oeuf.montant_vendu.toString() + " XOF",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                oeuf.nombre_casse.toString(),
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              ))
                            ]);
                          }).toList())),
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue.shade800),
                    width: MediaQuery.of(context).size.width * 0.99,
                    height: 45,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Poussins uun jour".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                              "Poussin".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800),
                            )),
                            DataColumn(
                                label: Text(
                              "Nombre initial".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800),
                            )),
                            DataColumn(
                                label: Text(
                              "Nombre en bon état".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800),
                            )),
                            DataColumn(
                                label: Text(
                              "Nombre perdu (mort)".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800),
                            )),
                            DataColumn(
                                label: Text(
                              "Montant total d'achat".toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800),
                            ))
                          ],
                          rows: poussins.map((poussin) {
                            return DataRow(cells: [
                              DataCell(Text(
                                poussin.nom,
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                poussin.nombre_initial.toString(),
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                poussin.nombre_bon_etat.toString(),
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                poussin.nombre_mort.toString(),
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text(
                                poussin.total_achat.toString() + " XOF",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              )),
                            ]);
                          }).toList())),
                  SizedBox(
                    height: 20,
                  )
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
