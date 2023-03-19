// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_client.dart';

class AProposDeNous extends StatelessWidget {
  const AProposDeNous({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerClient(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "A propos de nous",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
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
                "Qui sommes-nous ?",
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
                width: MediaQuery.of(context).size.width * 0.94,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "AGRIPILAYO, situé au Bénin, dans le département de la DONGA, commune de Ouaké, arrondissement  de Sèmèrè 2 , village de N'Djakada, non loin du montagne Alindaou, est spécialisée dans l'élévage. Ainsi vous offrons la possibilité à nos clients d'avoir de bon plats en mettant à leur disposition des oeufs de tables,pintades, dindons, poulets, canards, goliath ..., de moindre prix et de meilleure qualité. Nos clients peuvent depuis leur maison lancer leur commande peut importe qu'ils soient disposés à venir chercher leur commande ou pas. Par ailleurs, nous offrons des formations de meilleure qualité en production animale. Plus besoin de se déplacer, lancer vos commandes via AGRIPILAYO disponible sur Play Store.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          )),
    );
  }
}
