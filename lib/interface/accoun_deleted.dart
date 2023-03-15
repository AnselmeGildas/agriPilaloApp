// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:deogracias/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'connexion.dart';
import 'drawer_client.dart';

class AccountDeleted extends StatefulWidget {
  const AccountDeleted({super.key});

  @override
  State<AccountDeleted> createState() => _AccountDeletedState();
}

class _AccountDeletedState extends State<AccountDeleted> {
  @override
  void initState() {
    super.initState();
    _speak(
        "Cher utilisateur, votre compte a été désactivé ou supprimé par l'administrateur");
  }

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
          drawer: DrawerClient(),
          backgroundColor: Colors.green.shade800,
          appBar: AppBar(
            title: Text(
              "Agri PIYALO",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    _showMyDialog(context);
                  },
                  icon: Icon(Icons.login)),
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
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Votre compte a été supprimé ou désactiver par l'administrateur",
                      style: GoogleFonts.alike(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ));
  }
}

Future<void> _showMyDialog(
  BuildContext context,
) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Etes vous sur ?".toUpperCase()),
          content: SingleChildScrollView(
            child: ListBody(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("Voudriez vous déconnecter ?"),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Confirmer'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                          _speak("Vous avez été déconnecté");
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Login())));

                          // ignore: empty_catches
                        } catch (e) {
                          _speak("Une erreur inattendue s'est produite");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(.7),
                          textStyle: TextStyle()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Annuler'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        _speak("Deconnexion annulée");
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        );
      });
}

Future _speak(String text) async {
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
