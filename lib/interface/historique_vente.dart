// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_function_literals_in_foreach_calls, unused_local_variable, unnecessary_null_comparison

import 'package:deogracias/interface/historique_anne.dart';
import 'package:deogracias/interface/historique_deuxi_eme_date.dart';
import 'package:deogracias/interface/historique_intervalle.dart';
import 'package:deogracias/interface/historique_premiere_date.dart';
import 'package:deogracias/interface/provider_format_timestamp.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:deogracias/provider/provider_historique_vente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'drawer_admin.dart';

class HistoriqueVente extends StatefulWidget {
  HistoriqueVente({super.key});

  @override
  State<HistoriqueVente> createState() => _HistoriqueVenteState();
}

class _HistoriqueVenteState extends State<HistoriqueVente> {
  TextEditingController premiere_date = TextEditingController();

  TextEditingController deuxieme_date = TextEditingController();

  TextEditingController annee = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderHistoriqueVente>(context);
    final provider_format = Provider.of<ProviderFormatTimestamp>(context);
    int premiere_in_milli = 0;
    int deuxieme_in_milli = 0;
    premiere_in_milli = provider_format.premiere_date_in_miili;
    deuxieme_in_milli = provider_format.deuximed_date_in_milli;
    String anne = "";
    bool affiche = false;
    anne = provider.annee;
    affiche = provider.affiche;
    int nombre_vente_bete = 0;
    int nombre_vente_fientes = 0;
    int nombre_vente_oeuf_tables = 0;
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

    final list_ventes_betes = Provider.of<List<VenteBetes>>(context);
    final list_vente_oeuf_tables = Provider.of<List<VenteOeufTables>>(context);
    final list_ventef_fientes = Provider.of<List<VenteFientes>>(context);

    if (list_vente_oeuf_tables.isEmpty &&
        list_ventef_fientes.isEmpty &&
        list_ventes_betes.isEmpty) {
      return WillPopScope(
          onWillPop: ShowExitApp,
          child: Scaffold(
            backgroundColor: Colors.green.shade800,
            drawer: DrawerAdmin(),
            appBar: AppBar(
              actions: [
                Image.asset(
                  "images/icon2.jpg",
                  scale: 4.5,
                  height: 100,
                  width: 100,
                ),
              ],
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Historique de vente",
                style: GoogleFonts.alike(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ));
    }

    return WillPopScope(
        onWillPop: ShowExitApp,
        child: Scaffold(
          backgroundColor: Colors.green.shade800,
          drawer: DrawerAdmin(),
          appBar: AppBar(
            actions: [
              Image.asset(
                "images/icon2.jpg",
                scale: 4.5,
                height: 100,
                width: 100,
              ),
            ],
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Historique de vente",
              style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
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
                    height: 70,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black87,
                            width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Historique des ventes".toUpperCase(),
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 12),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Première date ",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 30),
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
                        provider_format.change_premiere(dateSelectionned);
                        if (format.isNotEmpty) {
                          premiere_date.text = format;
                        } else {
                          premiere_date.text = "";
                        }
                      },
                      controller: premiere_date,
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
                          "Deuxième date ",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                    child: TextField(
                      onTap: () async {
                        DateTime? dateSelectionned = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100));
                        var premi_in_days = dateSelectionned!.minute;
                        String format = dateSelectionned != null
                            ? DateFormat('dd-MM-yyyy').format(dateSelectionned)
                            : "";
                        provider_format.change_deuxieme(dateSelectionned);
                        if (format.isNotEmpty) {
                          deuxieme_date.text = format;
                        } else {
                          deuxieme_date.text = "";
                        }
                      },
                      controller: deuxieme_date,
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
                          "Annee ",
                          style: GoogleFonts.alike(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: TextField(
                      controller: annee,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        provider.change_annee(value);
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: anne.isEmpty || anne.length < 4
                                  ? BorderSide(color: Colors.redAccent)
                                  : BorderSide(color: Colors.blue)),
                          counterText: "",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.94,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          nombre_vente_oeuf_tables = 0;
                          nombre_vente_bete = 0;
                          nombre_vente_bete = 0;
                          try {
                            provider.affiche_true();
                            if (premiere_date.text.isEmpty &&
                                deuxieme_date.text.isEmpty &&
                                anne.isEmpty) {
                              provider.affiche_false();
                              _speak("Vous devez saisir les champs");
                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vous devez saisir les champs",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.8),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            } else if (premiere_date.text.isNotEmpty &&
                                deuxieme_date.text.isEmpty) {
                              list_ventef_fientes.forEach((element) {
                                if (element.created_at == premiere_date.text) {
                                  nombre_vente_fientes++;
                                }
                              });
                              list_vente_oeuf_tables.forEach((element) {
                                if (element.created_at == premiere_date.text) {
                                  nombre_vente_oeuf_tables++;
                                }
                              });
                              list_ventes_betes.forEach((element) {
                                if (element.created_at == premiere_date.text) {
                                  nombre_vente_bete++;
                                }
                              });

                              if (nombre_vente_fientes <= 0 &&
                                  nombre_vente_bete <= 0 &&
                                  nombre_vente_fientes <= 0) {
                                provider.affiche_false();
                                _speak(
                                    "Aucune vente éffectué pour la date saisie");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Aucune date effectuée pour la date saisie",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(.8),
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              } else {
                                provider.affiche_false();

                                _speak("Patientez s'il vous plait");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HistoriquePremiereDate(
                                              premiere_date:
                                                  premiere_date.text),
                                    ));
                              }
                            } else if (deuxieme_date.text.isNotEmpty &&
                                premiere_date.text.isEmpty) {
                              list_ventef_fientes.forEach((element) {
                                if (element.created_at == deuxieme_date.text) {
                                  nombre_vente_fientes++;
                                }
                              });
                              list_vente_oeuf_tables.forEach((element) {
                                if (element.created_at == deuxieme_date.text) {
                                  nombre_vente_oeuf_tables++;
                                }
                              });
                              list_ventes_betes.forEach((element) {
                                if (element.created_at == deuxieme_date.text) {
                                  nombre_vente_bete++;
                                }
                              });

                              if (nombre_vente_fientes <= 0 &&
                                  nombre_vente_bete <= 0 &&
                                  nombre_vente_fientes <= 0) {
                                provider.affiche_false();
                                _speak(
                                    "Aucune vente éffectué pour la date saisie");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Aucune date effectuée pour la date saisie",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(.8),
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              } else {
                                provider.affiche_false();

                                _speak("Patientez s'il vous plait");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HistoriqueDeuxiemeDate(
                                              premiere_date:
                                                  deuxieme_date.text),
                                    ));
                              }
                            } else if (premiere_date.text.isNotEmpty &&
                                deuxieme_date.text.isNotEmpty) {
                              list_ventef_fientes.forEach((element) {
                                if (element.created_at_in_days >=
                                        premiere_in_milli &&
                                    element.created_at_in_days <=
                                        deuxieme_in_milli) {
                                  nombre_vente_fientes++;
                                }
                              });
                              list_vente_oeuf_tables.forEach((element) {
                                if (element.created_at_in_days >=
                                        premiere_in_milli &&
                                    element.created_at_in_days <=
                                        deuxieme_in_milli) {
                                  nombre_vente_oeuf_tables++;
                                }
                              });
                              list_ventes_betes.forEach((element) {
                                if (element.created_at_in_days >=
                                        premiere_in_milli &&
                                    element.created_at_in_days <=
                                        deuxieme_in_milli) {
                                  nombre_vente_bete++;
                                }
                              });

                              if (nombre_vente_fientes <= 0 &&
                                  nombre_vente_bete <= 0 &&
                                  nombre_vente_fientes <= 0) {
                                provider.affiche_false();
                                _speak(
                                    "Aucune vente éffectué pour les dates renseignés");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Aucune date effectuée pour les dates saisies",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(.8),
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              } else {
                                provider.affiche_false();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HistoriqueIntervalle(
                                              premiere_date_in_milli:
                                                  premiere_in_milli,
                                              deuxieme_date_in_milli:
                                                  deuxieme_in_milli,
                                              premiere_date: premiere_date.text,
                                              deuxieme_date:
                                                  deuxieme_date.text),
                                    ));
                              }
                            }

                            if (annee.text.isNotEmpty) {
                              list_ventef_fientes.forEach((element) {
                                if (element.annee == annee.text) {
                                  nombre_vente_fientes++;
                                }
                              });
                              list_vente_oeuf_tables.forEach((element) {
                                if (element.annee == annee.text) {
                                  nombre_vente_oeuf_tables++;
                                }
                              });
                              list_ventes_betes.forEach((element) {
                                if (element.annee == annee.text) {
                                  nombre_vente_bete++;
                                }
                              });

                              if (nombre_vente_fientes <= 0 &&
                                  nombre_vente_bete <= 0 &&
                                  nombre_vente_fientes <= 0) {
                                provider.affiche_false();
                                _speak(
                                    "Aucune vente éffectué pour l'année que vous avez saisie");
                                final snakbar = SnackBar(
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Aucune date effectuée pour l'année saisie saisie",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(.8),
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakbar);
                              } else {
                                provider.affiche_false();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HistoriqueAnnee(
                                            premiere_date: annee.text)));
                              }
                            }
                          } catch (e) {
                            provider.affiche_false();
                            _speak("une erreur s'est produite");
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  /* "une erreur s'est produite",*/ e
                                      .toString(),
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
                                "Recherche".toUpperCase(),
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
              )),
        ));
  }
}

Future _speak(String text) async {
  final FlutterTts flutterTts = FlutterTts();
  flutterTts.setLanguage("Fr");
  flutterTts.setSpeechRate(0.5);
  flutterTts.setVolume(0.5);
  flutterTts.setPitch(1.0);
  flutterTts.speak(text);
}
