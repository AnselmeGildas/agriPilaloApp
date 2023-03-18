// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously, unnecessary_null_comparison, avoid_types_as_parameter_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:deogracias/interface/creer_compte.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/provider/provider_create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/registration.dart';
import 'wrapper.dart';

class ValidateUserEmail extends StatelessWidget {
  ValidateUserEmail({
    Key? key,
    required this.email,
    required this.user_nom,
    required this.user_prenom,
    required this.user_telephone,
    required this.user_date_naissance,
    required this.sexe,
    required this.user_password,
    required this.code,
  }) : super(key: key);

  final String email;
  final String user_nom;
  final String user_prenom;
  final String user_telephone;
  final String user_date_naissance;
  final String sexe;
  final String user_password;

  final int code;
  bool affice = false;
  int _code = 0;
  TextEditingController _code_saisi = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  int leng = 0;

  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<firebaseAuth>(context);
    final _affiche = Provider.of<providerCreateAccount>(context);
    affice = _affiche.circular;
    _code = _affiche.code;
    leng = email.length;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerClient(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Validate user e-mail",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
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
          mainAxisAlignment: MainAxisAlignment.center,
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
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Validation d'adresse E-Mail ",
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
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
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Un code a été envoyé à l'email " +
                    email +
                    "\n Veuillez le saisir",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Veuillez saisir ce code svp !",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 2),
              child: TextField(
                controller: _code_saisi,
                onChanged: (value) {
                  _affiche.change_code(value);
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 5,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black),
                  counterText: "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: (() async {
                      _affiche.circular_true();

                      try {
                        if (_code_saisi.text.isEmpty ||
                            _code_saisi.text.length != 5) {
                          _affiche.circular_false();

                          _speak(
                              "Le code saisi est vide ou incorrecte. Veuillez vérifier et réessayez. Merci");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le code saisi est vide ou incoorecte ! !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else if (_code == code) {
                          final _result =
                              await firebase.createUserWithEmailAndPassword(
                                  email, user_password);

                          if (_result != null) {
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(auth.currentUser!.uid)
                                .set({
                              "deleted": false,
                              "nom": user_nom,
                              "prenom": user_prenom,
                              "sexe": sexe,
                              "date_naissance": user_date_naissance,
                              "telephone": user_telephone,
                              "email": email,
                              "timestamp": DateTime.now(),
                              "admin": false,
                              "is_active": false,
                              "photo_url": "",
                              'role': "Employé",
                              "mdp": sha1
                                  .convert(utf8.encode(user_password.trim()))
                                  .toString(),
                            });

                            _speak("Votre compte a été créé avec succès");
                            _affiche.circular_false();

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Votre compte a été créé avec succès",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.black87,
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Wrapper())));
                          } else {
                            _speak(
                                "L'email utilisé existe déjà ou le mot de passe que vous avez utilisé est moins sécurisé. Réessayez s'il vous plait");
                            _affiche.circular_false();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "L'email utilisé existe dèjà ou le mot de passe utilisé est moins sécurisé. Veuillez réessayez svp !",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SignUp())));
                          }
                        } else {
                          _affiche.circular_false();
                          _speak(
                              "Le code saisi est incorrecte. Merci de réessayez");

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le code saisi incoorecte ! !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      } catch (e) {
                        _affiche.circular_false();
                        _speak(
                            "Une erreur s'est produite. Vérifiez votre connection internet et réessayez. Merci");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                /* "Une erreur s'est produite. Merci de vérifiez votre connection internet et réessayez!"*/ e
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: affice
                            ? CircularProgressIndicator(
                                color: Colors.cyanAccent,
                              )
                            : Text(
                                "Saisissez le code".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
