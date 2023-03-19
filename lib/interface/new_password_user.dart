// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:deogracias/interface/connexion.dart';
import 'package:deogracias/interface/provider_new_pawword.dart';
import 'package:deogracias/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewPasswordUser extends StatefulWidget {
  const NewPasswordUser({super.key});

  @override
  State<NewPasswordUser> createState() => _NewPasswordUserState();
}

class _NewPasswordUserState extends State<NewPasswordUser> {
  TextEditingController ancien_password_saisie = TextEditingController();

  TextEditingController npuveau_password_saisie = TextEditingController();

  TextEditingController confirm_password_saisie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String ancien_password = "";
    String nouveau_password = "";
    String confirm_password = "";
    bool affiche = false;
    bool is_obscure_nouveau_password = true;

    final user = Provider.of<donnesUtilisateur>(context);
    final provider = Provider.of<ProviderNewPassword>(context);
    ancien_password = provider.ancien_password;
    nouveau_password = provider.nouveau_password;
    confirm_password = provider.confirm_password;
    affiche = provider.affiche;
    is_obscure_nouveau_password = provider.is_obscure_nouveau_password;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        leading: Image.asset(
          "images/icon2.jpg",
          scale: 4.5,
          height: 100,
          width: 100,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Image.asset(
            "images/image2.jpeg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Nouveau mot de passe",
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
              "Nouveau mot de passe",
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
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mot de passe actuel  ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak("Je tape mon mot de passe actuel");
                },
                controller: ancien_password_saisie,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: ancien_password.isEmpty ||
                                ancien_password.length < 8
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_ancien_password(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nouveau mot de passe  ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak("Je tape mon mot de passe nouveau");
                },
                controller: npuveau_password_saisie,
                autocorrect: true,
                obscureText: is_obscure_nouveau_password,
                enableSuggestions: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          provider.change_is_obscure_nouveau_password();
                        },
                        icon: is_obscure_nouveau_password
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: nouveau_password.isEmpty ||
                                nouveau_password.length < 8
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_nouveau_password(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirmation de mot de passe  ",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak("Je confirme mon mot de passe nouveau");
                },
                controller: confirm_password_saisie,
                autocorrect: true,
                obscureText: true,
                obscuringCharacter: "*",
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: confirm_password.isEmpty ||
                                confirm_password.length < 8 ||
                                confirm_password != nouveau_password
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_confirm_password(value);
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.92,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () async {
                    try {
                      provider.affiche_true();

                      if (ancien_password_saisie.text.isEmpty ||
                          ancien_password_saisie.text.length < 8 ||
                          npuveau_password_saisie.text.length < 8 ||
                          confirm_password_saisie.text.length < 8 ||
                          npuveau_password_saisie.text.isEmpty ||
                          confirm_password_saisie.text.isEmpty) {
                        provider.affiche_false();
                        _speak(
                            "Vous devez bien saisir ces champs. Le mot de passe doit contenir au moins 8 caractères");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Le mot de passe doit contenir au moins 8 caractères. Veuillez réessayer",
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
                      } else if (npuveau_password_saisie.text !=
                          confirm_password_saisie.text) {
                        provider.affiche_false();
                        _speak("Vous avez mal confirmé le mot de passe");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Vous avez mal confirmé le mot de passe",
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
                      } else if (sha1
                              .convert(utf8
                                  .encode(ancien_password_saisie.text.trim()))
                              .toString() !=
                          user.mdp) {
                        provider.affiche_false();
                        _speak(
                            "Le mot de passe saisie ne correspond pas au votre. Veuillez réessayer");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mot de passe incorrect. Réessayer encore. Merci",
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
                      } else {
                        await FirebaseAuth.instance.currentUser!.updatePassword(
                            npuveau_password_saisie.text.trim());
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(user.uid)
                            .update({
                          "mdpn": sha1
                              .convert(utf8
                                  .encode(npuveau_password_saisie.text.trim()))
                              .toString(),
                        });
                        provider.affiche_false();
                        _speak(
                            "Mot de passe changé avec succès. Vous serez immédiatement déconnecter puis rédiriger vers la page  de connection afin de vous connecter avec ce nouveau mot depasse");

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mot de passe modifié avec succès",
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
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      }
                    } catch (e) {
                      provider.affiche_false();
                      _speak(
                          "une erreur s'est produite.. Cette opération nécessite que vous vous déconnecter d'abord. Ensuite, réconnectez vous et procédez immédiatement au changement de mot de passe. Vérifiez aussi si vous avez activé les données mobiles. Merci de réessayer");
                      final snakbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "une erreur s'est produite",
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
                    }
                  },
                  child: affiche
                      ? CircularProgressIndicator(
                          color: Colors.black87,
                        )
                      : Text(
                          "Changez le mot de passe".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        )),
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
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
