// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:deogracias/interface/stream_vague_information.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/provider_search.dart';
import 'drawer_admin.dart';

class ListVagues extends StatelessWidget {
  const ListVagues({super.key});

  @override
  Widget build(BuildContext context) {
    final vagues = Provider.of<List<Vagues>>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    final budget = Provider.of<Budget>(context);
    final provider = Provider.of<Search>(context);
    String value = provider.value;
    bool affiche = provider.afficher;
    if (vagues.isEmpty) {
      return Scaffold(
        drawer: DrawerAdmin(),
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
          centerTitle: true,
          title: Text(
            "Vagues",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
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
        drawer: DrawerAdmin(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  provider.afficher_void();
                },
                icon: Icon(Icons.search, color: Colors.black)),
          ],
          elevation: 0,
          centerTitle: false,
          title: affiche
              ? Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: TextField(
                    autocorrect: true,
                    autofocus: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true),
                    onChanged: (value) {
                      provider.change_value(value);
                    },
                  ),
                )
              : Text(
                  "Vagues",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Vagues vague = vagues[index];
            return !affiche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StreamVagueInformation(
                              vague_uid: vague.uid,
                              user_uid: vague.user_uid,
                            ),
                          ));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade900,
                      child: Text(
                        vague.nom.substring(0, 2).toUpperCase(),
                        style: GoogleFonts.alike(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          _Delete(
                              context,
                              vague.nom,
                              vague.uid,
                              budget.uid,
                              budget.solde_total,
                              budget.depense,
                              budget.perte,
                              user.admin,
                              user.mdp);
                        },
                        icon: Icon(Icons.delete)),
                    title: Text(
                      vague.nom,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alike(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.sell_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          vague.created_at + " à " + vague.created_at_heure,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : vague.nom.toLowerCase().contains(value.toLowerCase())
                    ? ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              _Delete(
                                  context,
                                  vague.nom,
                                  vague.uid,
                                  budget.uid,
                                  budget.solde_total,
                                  budget.depense,
                                  budget.perte,
                                  user.admin,
                                  user.mdp);
                            },
                            icon: Icon(Icons.delete)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StreamVagueInformation(
                                    user_uid: vague.user_uid,
                                    vague_uid: vague.uid),
                              ));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            vague.nom.substring(0, 2).toUpperCase(),
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          vague.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.sell_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              vague.created_at + " à " + vague.created_at_heure,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : Container();
          },
          itemCount: vagues.length,
        ));
  }

  Future<void> _Delete(
      BuildContext context,
      String vague_nom,
      String vague_uid,
      String budget_uid,
      int budget_solde_total,
      int budget_depense,
      int budget_perte,
      bool is_admin,
      String user_password) async {
    TextEditingController password = TextEditingController();
    int budget_tiers_solde_total = 0;
    int budget_tiers_perte = 0;
    int budget_tiers_depense = 0;
    String budget_tiers_uid = "budget_tiers";
    String _password = "";
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            "Avertissement".toUpperCase(),
            style: GoogleFonts.alike(
                fontWeight: FontWeight.bold, color: Colors.red),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Vous etes sur le point de supprimer la vague  " +
                      vague_nom +
                      " de la base de données de cette entreprise. Cette action est irréversible",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Votre mot de passe",
                  style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    obscuringCharacter: "-",
                    enableSuggestions: true,
                    autocorrect: true,
                  ),
                ),
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
                          _password = password.text.isNotEmpty
                              ? sha1
                                  .convert(utf8.encode(password.text.trim()))
                                  .toString()
                              : "";
                          if (!is_admin) {
                            _speak(
                                "Cher utilisateur, vous n'avez pas les droits récquis pour pouvoir éffectuer cette action surla base de données. Désolé");
                          } else if (password.text.isEmpty) {
                            _speak(
                                "Nous dévrions avant tout valider votre identité. Pour cela, vous devrez saisir votre mot de passe");
                          } else if (_password != user_password) {
                            _speak(
                                "Le mot de passe saisi ne correspond pas au votre. Réessayez s'il vous plait");
                          } else {
                            _speak("suppression en cours");

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(vague_uid)
                                .collection("budget")
                                .doc(budget_tiers_uid)
                                .get()
                                .then((DocumentSnapshot document) {
                              budget_tiers_depense =
                                  (document.data() as Map)['depense'];
                              budget_tiers_perte =
                                  (document.data() as Map)['perte'];
                              budget_tiers_solde_total =
                                  (document.data() as Map)['solde_total'];
                            });

                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(budget_uid)
                                .update({
                              "solde_total":
                                  budget_solde_total - budget_tiers_solde_total,
                              "depense": budget_depense - budget_tiers_depense,
                              "perte": budget_perte - budget_tiers_perte
                            });

                            await FirebaseFirestore.instance
                                .collection("vagues")
                                .doc(vague_uid)
                                .delete();

                            _speak("Suppression effectué avec succès");
                            Navigator.of(dialogContext).pop();
                          }
                          // ignore: empty_catches
                        } catch (e) {
                          _speak("une erreur s'est produite");
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
                        _speak("Suppression du vague annulée");
                        Navigator.of(dialogContext).pop();
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
      },
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
