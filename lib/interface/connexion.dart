// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/interface/forgot_password.dart';
import 'package:deogracias/provider/provider_connexion.dart';
import 'package:deogracias/services/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'creer_compte.dart';
import 'wrapper.dart';

class Login extends StatelessWidget {
  Login({super.key});

  bool connexion = false;
  bool obscure = false;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProviderConnexion>(context);
    connexion = _provider.connexion;
    obscure = _provider.is_obscure;
    password = _provider.password;
    email = _provider.email;
    final _auth = Provider.of<firebaseAuth>(context);
    return Scaffold(
      drawer: DrawerClient(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Connexion",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
          // ignore: prefer_const_literals_to_create_immutables
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
                        "images/image2.jpeg",
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Connexion au compte",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 2,
              width: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Adresse E-Mail ** ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextFormField(
                  autocorrect: true,
                  enableSuggestions: true,
                  onChanged: (value) {
                    _provider.change_email(value);
                  },
                  onTap: () {
                    _speak("Votre adresse mail");
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: email.isEmpty ||
                                  email.length < 7 ||
                                  !email.contains("@")
                              ? BorderSide(color: Colors.redAccent)
                              : BorderSide(color: Colors.blue)),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black)),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Mot de passe",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 20, right: 20),
              child: TextFormField(
                autocorrect: true,
                enableSuggestions: true,
                obscuringCharacter: "*",
                onChanged: (value) {
                  _provider.change_password(value);
                },
                onTap: () {
                  _speak("Votre mot de passe");
                },
                obscureText: !obscure,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: password.isEmpty || password.length < 8
                          ? BorderSide(color: Colors.redAccent)
                          : BorderSide(color: Colors.blue)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _provider.obscure_true();
                    },
                    child: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 49,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade800),
                  onPressed: () async {
                    try {
                      _provider.connexion_true();
                      if (password.isEmpty ||
                          password.length < 8 ||
                          email.isEmpty ||
                          !email.contains("@")) {
                        _speak("Saisissez bien les champs");
                        _provider.connexion_false();

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tous les champs sont obligatoires. Veuillez vérifier si vous avez bien renseigné tous ces champs svp !",
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
                      } else {
                        final result = await _auth.signInWithEmailAndPassword(
                            email.trim(), password.trim());

                        if (result != null) {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .update({
                            "mdp": sha1
                                .convert(utf8.encode(password.trim()))
                                .toString()
                          });
                          _provider.connexion_false();
                          _speak(
                              "Vous avez été connecté. Veuillez patienter s'il vous plait pour la redirection. Merci");

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Wrapper())));
                        } else {
                          _provider.connexion_false();
                          _speak(
                              "L'adresse mail ou le mot de passe saisi est incorrecte. Si vous avez oublié votre mot de passe , cliquez sur mot de passe oublié afin de le réinitialiser");

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "E-Mai ou mot de passe incorrect. Veuillez réessayez svp !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                        }
                      }
                    } catch (e) {
                      _provider.connexion_false();
                      _speak(
                          "Une erreur s'est produite. Vérifiez votre connexion internet et réessayez s'il vous plait");
                      final snakbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Une erreur inattendue s'est produite. Vérifiez votre connexion internet et réessayez svp!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                    }
                  },
                  child: connexion
                      ? CircularProgressIndicator(color: Colors.cyan)
                      : Text(
                          "Connexion".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white, style: BorderStyle.solid, width: 5)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                  },
                  child: Text(
                    "Mot de passe oublié ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "N'avez-vous pas encore un compte actif ? ".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 47,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Créez un compte".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.brown.shade800,
                          fontWeight: FontWeight.bold),
                    ))),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Future _speak(String text) async {
    final FlutterTts _flutter_tts = FlutterTts();
    _flutter_tts.setLanguage("Fr");
    _flutter_tts.setSpeechRate(0.5);
    _flutter_tts.setVolume(0.5);
    _flutter_tts.setPitch(1.0);
    _flutter_tts.speak(text);
  }
}
