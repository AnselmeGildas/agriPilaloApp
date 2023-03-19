// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable, unused_local_variable, use_build_context_synchronously

import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/interface/validate_user_email.dart';
import 'package:deogracias/provider/provider_create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import 'connexion.dart';
import 'random.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController nom_utilisateur = TextEditingController();
  TextEditingController date_naissance = TextEditingController();
  TextEditingController prenom_utilisateur = TextEditingController();
  TextEditingController email_user = TextEditingController();
  TextEditingController numero_user = TextEditingController();
  TextEditingController password_user = TextEditingController();
  TextEditingController confirm_password_user = TextEditingController();
  String nom = "";
  String prenom = "";
  String sexe = "Masculin";
  String email = "";
  String numero = "";
  String password = "";
  String confirm_password = "";
  bool affiche = false;
  bool password_obscure = true;
  int _code = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<providerCreateAccount>(context);
    nom = provider.nom;
    prenom = provider.prenom;
    sexe = provider.sexe;
    email = provider.email;
    numero = provider.numero;
    password = provider.password;
    confirm_password = provider.confirm_password;
    affiche = provider.affiche;
    password_obscure = provider.password_obscure;
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerClient(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Creat account",
          style: TextStyle(
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
              "Création de compte",
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
              height: 70,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 3,
                      color: Colors.redAccent)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 15, top: 15),
                child: Text(
                  "Renseignez bien les informations".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Votre nom svp !",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                controller: nom_utilisateur,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: nom.isEmpty || nom.length < 3
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_nom(value, nom_utilisateur);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Votre prénom svp !",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                autocorrect: true,
                controller: prenom_utilisateur,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: prenom.isEmpty || prenom.length < 3
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_prenom(value, prenom_utilisateur);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Adresse E-Mail",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                controller: email_user,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: email.isEmpty ||
                                email.length < 7 ||
                                !email.contains("@")
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_email(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Votre numéro",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                controller: numero_user,
                maxLength: 8,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide: numero.isEmpty || numero.length < 8
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_numero(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date de naissance",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                onTap: () async {
                  DateTime? dateSelectionned = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  String format = dateSelectionned != null
                      ? DateFormat('dd-MM-yyyy').format(dateSelectionned)
                      : "";
                  if (format.isNotEmpty) {
                    date_naissance.text = format;
                  }
                },
                controller: date_naissance,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sexe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text(
                    "Masculin".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "Masculin",
                  groupValue: sexe,
                  onChanged: (value) {
                    provider.change_sexe(value);
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Féminin".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: "Féminin",
                  groupValue: sexe,
                  onChanged: (value) {
                    provider.change_sexe(value);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mot de passe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                controller: password_user,
                obscureText: password_obscure,
                obscuringCharacter: "*",
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        provider.change_password_obscure();
                      },
                      child: Icon(
                        password_obscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: password.isEmpty || password.length < 8
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  provider.change_password(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirmer le mot de passe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: TextField(
                controller: confirm_password_user,
                obscureText: true,
                obscuringCharacter: "*",
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: confirm_password.isEmpty ||
                                confirm_password.length < 8 ||
                                confirm_password != password
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
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                height: 47,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade800),
                    onPressed: () async {
                      try {
                        if (nom.isEmpty ||
                            nom.length < 3 ||
                            prenom.isEmpty ||
                            prenom.length < 3 ||
                            email.isEmpty ||
                            email.length < 7 ||
                            !email.contains('@') ||
                            numero.isEmpty ||
                            numero.length != 8 ||
                            sexe.isEmpty ||
                            password.length < 8 ||
                            confirm_password != password ||
                            nom_utilisateur.text.isEmpty ||
                            prenom_utilisateur.text.isEmpty ||
                            email_user.text.isEmpty ||
                            numero_user.text.isEmpty ||
                            password_user.text.isEmpty ||
                            confirm_password_user.text.isEmpty) {
                          provider.affiche_false();
                          _speak(
                              "Renseignez bien toutes les informations s'il vous plait");
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Certaines informations sont mal renseignées !",
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
                          _code = RandomDigits.getInteger(5);

                          String username = 'agripilalo@gmail.com';
                          String password = 'kgbadpzwmbaxkzch';

                          final smtpServer = gmail(username, password);
                          // Use the SmtpServer class to configure an SMTP server:
                          // final smtpServer = SmtpServer('smtp.domain.com');
                          // See the named arguments of SmtpServer for further configuration
                          // options.

                          // Create our message.
                          final message = Message()
                            ..from = Address(username, 'Agripilayo')
                            ..recipients.add(email.trim())
                            ..ccRecipients
                            //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                            //..bccRecipients.add(Address('bccAddress@example.com'))
                            ..subject = "Validation de l'adresse e-mail"
                            // ignore: prefer_interpolation_to_compose_strings
                            ..text = " " +
                                _code.toString().toUpperCase() +
                                " \n Voici le code de validation de votre adresse E-Mail pour la création de compte sur Agri Pilalo. Veuillez saisir ce code dans un bref dèlai";
                          //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                          final sendReport = await send(message, smtpServer);

                          _speak(
                              "Un code à 5 chiffres a été envoyé sur l'adresse mail saisi. Consulter votre boite mail et renseignez le . Merci");
                          provider.affiche_false();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ValidateUserEmail(
                                      email: email,
                                      user_nom: nom_utilisateur.text,
                                      user_prenom: prenom_utilisateur.text,
                                      user_telephone: numero,
                                      user_date_naissance: date_naissance.text,
                                      sexe: sexe,
                                      user_password: password,
                                      code: _code)));
                        }
                      } catch (e) {
                        provider.affiche_false();
                        _speak("Une erreur s'est produite");
                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur s'est produite !",
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
                            color: Colors.cyan,
                          )
                        : Text(
                            "Créer le compte".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "J'ai déjà un compte ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  "images/sticker.png",
                  scale: 2.5,
                  fit: BoxFit.cover,
                  height: 20,
                  width: 20,
                ),
              ],
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
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Connectez-vous alors".toUpperCase(),
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
}

Future _speak(String text) async {
  final FlutterTts flutter_tts = FlutterTts();
  flutter_tts.setLanguage("Fr");
  flutter_tts.setSpeechRate(0.5);
  flutter_tts.setVolume(0.5);
  flutter_tts.setPitch(1.0);
  flutter_tts.speak(text);
}
