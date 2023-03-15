// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_client.dart';

class ContactsEntreprise extends StatelessWidget {
  const ContactsEntreprise({super.key});

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
          "Contacts",
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
                "Contacts de l'entreprise",
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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Pour nous joindre, veuillez contacter le (229) 66 97 90 69 / (228) 93 98 65 69 / (228) 91 21 20 37 ou envoyer un message à l'adrsse E-Mail agripiyalo@gmail.com. \nPour signaler un problème en rapport avec cette application, veuillez contacter le (229) 97 39 20 26 / (229) 95 97 70 91 ou envoyer un messgae à l'adrsse marcellindeveloppeur@gmail.com",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
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
