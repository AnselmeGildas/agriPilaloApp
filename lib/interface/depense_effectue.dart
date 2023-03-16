// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:deogracias/interface/drawer_vague_admin.dart';
import 'package:deogracias/modele/depense.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepenseEffectue extends StatelessWidget {
  const DepenseEffectue({super.key, required this.vague_uid});
  final String vague_uid;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final depense = Provider.of<Depenses>(context);
    return Scaffold(
      drawer: DrawerVagueAdmin(vague_uid: vague_uid),
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
          "Dépense éffectuée",
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
                "Dépense éffecutée",
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
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.93,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue.shade900),
                          onPressed: () {},
                          child: Expanded(
                              child: Text(
                            "Informations sur la dépense".toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Description",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Text(
                              depense.description,
                              maxLines: 15,
                              softWrap: true,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Montant dépensé",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Text(
                              depense.montant.toString() + " XOF",
                              maxLines: 2,
                              softWrap: true,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Enregistré le",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Text(
                              depense.created_at +
                                  " à " +
                                  depense.created_at_heure,
                              maxLines: 2,
                              softWrap: true,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Par :",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Text(
                              user.prenom + " " + user.nom,
                              maxLines: 2,
                              softWrap: true,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Son E-Mail :",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Text(
                              user.email,
                              maxLines: 2,
                              softWrap: true,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Son contact",
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Text(
                              user.telephone,
                              maxLines: 2,
                              softWrap: true,
                              style: GoogleFonts.alike(
                                  color: Colors.lightBlue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}
