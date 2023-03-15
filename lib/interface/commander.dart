// ignore_for_file: prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, use_build_context_synchronously, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/commander_next_page.dart';
import 'package:deogracias/interface/drawer_client.dart';
import 'package:deogracias/provider/provider_gestion_commande.dart';
import 'package:deogracias/provider/provider_gestion_departement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Commande extends StatefulWidget {
  Commande({super.key});

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  bool nom_bool = false;
  bool email_bool = false;
  bool numero_bool = false;
  bool achat_bool = false;
  bool description_bool = false;
  bool exigences_bool = false;
  bool is_empty = true;
  String client_uid = "";
  String nom = "";

  String email = "";

  String numero = "";

  String achat = "";

  String description = "";

  TextEditingController date_livraison = TextEditingController();
  TextEditingController nom_controller = TextEditingController();
  TextEditingController heure_livraison = TextEditingController();
  String exigences_client = "";

  String departement = "DONGA";

  String commu = "";

  String arrondissement = "SEMERE 2";

  String village = "N'DJAKADA";

  bool affiche = false;

  String pays = "BENIN";

  bool venir_chercher = true;
  int nombre = 0;

  @override
  void initState() {
    super.initState();
    _speak("renseignez bien les informations");
  }

  @override
  Widget build(BuildContext context) {
    final gestion_commande = Provider.of<ProviderGestionCommande>(context);
    nom = gestion_commande.nom;
    email = gestion_commande.email;
    numero = gestion_commande.numero;
    achat = gestion_commande.achat;
    description = gestion_commande.description;
    exigences_client = gestion_commande.exigences;
    final _provider = Provider.of<ProviderGestionDepartement>(context);
    nom_bool = gestion_commande.nom_bool;
    email_bool = gestion_commande.email_bool;
    numero_bool = gestion_commande.numero_bool;
    achat_bool = gestion_commande.achat_bool;
    description_bool = gestion_commande.description_bool;
    exigences_bool = gestion_commande.exigences_bool;
    venir_chercher = _provider.venir_chercher;
    departement = _provider.departement;
    commu = _provider.commune;
    arrondissement = _provider.arrondissement;
    village = _provider.village;
    affiche = _provider.affiche;
    pays = _provider.pays;

    return Scaffold(
      drawer: DrawerClient(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Image.asset(
            "images/icon2.jpg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Passer une commande",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
              height: 50,
            ),
            Text(
              "Passer une commande",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
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
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 3,
                      color: Colors.redAccent)),
              child: Text(
                "renseigner bien vos informations".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15),
                child: Text(
                  "Pays",
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: DropdownButton<String>(
                  value: pays,
                  iconSize: 0.0,
                  isDense: true,
                  isExpanded: true,
                  items: <String>[
                    "BENIN",
                    "TOGO",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (newValue) {
                    _provider.change_pays(newValue!);
                  }),
            ),
            pays == "TOGO"
                ? Container()
                : Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          "Département",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: DropdownSearch<String>(
                          popupProps: PopupProps.dialog(
                            showSelectedItems: false,
                            showSearchBox: true,
                          ),
                          selectedItem: departement,
                          items: <String>[
                            "DONGA",
                            "ATACORA",
                            "ATLANTIQUE",
                            "BORGOU",
                            "ALIBORI",
                            "COUFFO",
                            "ZOU",
                            "COLLINES",
                            "PLATEAU",
                            "LITTORAL",
                            "OUEME",
                            "MONO"
                          ].map((value) => value).toList(),
                          onChanged: (newValue) {
                            _provider.change_departement(newValue!);
                          }),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          "Commune",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: DropdownSearch<String>(
                          popupProps: PopupProps.dialog(
                            showSelectedItems: false,
                            showSearchBox: true,
                          ),
                          selectedItem: commu,

                          // ignore: prefer_const_literals_to_create_immutables
                          items: <String>[
                            "OUAKE",
                            "BASSILA",
                            "COPARGO",
                            "DJOUGOU",
                            "NATITINGOU",
                            "KEROU",
                            "KOUANDE",
                            "PEHUNCO",
                            "COBLY",
                            "BOUKOUMBE",
                            "MATERI",
                            "TOUCOUNTOUNA",
                            "TANGUIETA"
                                "ABOMEY-CALAVI",
                            "ALLADA",
                            "KPOMASSE",
                            "OUIDAH",
                            "SO-AVA",
                            "TOFFO",
                            "ZE",
                            "TORI-BOSSITO"
                                "N'DALI",
                            "NIKKI",
                            "KALALE",
                            "PERERE",
                            "SINENDE",
                            "BEMBEREKE",
                            "TCHAOUROU",
                            "PARAKOU"
                                "KANDI",
                            "BANIKOARA",
                            "GOGOUNOU",
                            "KARIMAMA",
                            "MALANVILLE",
                            "SEGBANA"
                                "APLAHOUE",
                            "LALO",
                            "TOVIKLIN",
                            "DOGBODJAKOTOMEY",
                            "KLOUEKANME",
                            "TOVIKLIN"
                                "ABOMEY",
                            "BOHICON",
                            "COVE",
                            "DJIDJA",
                            "OUINHI",
                            "ZA-KPOTA",
                            "ZOGBODOMEY",
                            "ZAGNANADO",
                            "AGNANGNIKOUN"
                                "BANTE",
                            "DASSA-ZOUME",
                            "GLAZOUE",
                            "OUESSE",
                            "SAVALOU",
                            "SAVE"
                                "POBE",
                            "SAKETE",
                            "KETOU",
                            "IFANGNI",
                            "ADJA-OUERE"
                                "COTONOU",
                            "ADJARRA",
                            "ADJOHOUN",
                            "AGUEGUE",
                            "DJOUGOU",
                            "AKPRO-MISSERETE",
                            "AVRANKOU",
                            "BONOU",
                            "DANGBO",
                            "PORTO-NOVO"
                          ].map((e) => e).toList(),
                          onChanged: (newValue) {
                            _provider.change_commune(newValue!);
                          }),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          "Arrondissement",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: DropdownSearch<String>(
                          popupProps: PopupProps.dialog(
                            showSelectedItems: false,
                            showSearchBox: true,
                          ),
                          selectedItem: arrondissement,

                          // ignore: prefer_const_literals_to_create_immutables
                          items: <String>[
                            "Badjoudè",
                            "Kondé",
                            "Ouaké",
                            "Sèmèrè I",
                            "Sèmèrè II",
                            "Tchalinga",
                            "Barei",
                            "Bariénou",
                            "Bélléfoungou",
                            "Bougou",
                            "Djougou I",
                            "Djougou II",
                            "Djougou III",
                            "Kolokondé",
                            "Onklou",
                            "Patargo",
                            "Pélébina",
                            "Sérou",
                            "Anandana",
                            "Copargo",
                            "Pabégou",
                            "Singré",
                            "Alédjo",
                            "Bassila",
                            "Manigri",
                            "Pénéssoulou",
                            "Banikoara",
                            "Founougo",
                            " Gomparou",
                            "Goumori",
                            "Kokey",
                            "Kokiborou",
                            "Ounet",
                            "Sompérékou",
                            "Soroko",
                            "Toura",
                            "Bagou",
                            "Gogounou",
                            "Gounarou",
                            "Ouara",
                            "Sori",
                            "Zoungou-Pantrossi",
                            "Angaradébou",
                            "Bensékou",
                            "Donwari",
                            "Kandi I",
                            "Kandi II",
                            "Kandi III",
                            "Kassakou",
                            "Saah",
                            "Sam",
                            "Sonsoro",
                            "Birni Lafia",
                            "Bogo-Bogo",
                            "Karimama",
                            "Kompa",
                            "Monsey",
                            "Garou",
                            "Guéné2",
                            "Malanville",
                            "Madécali",
                            "Toumboutou",
                            "Libantè",
                            "Liboussou",
                            "Lougou",
                            "Segbana",
                            "Sokotindji",
                            "Boukoumbé",
                            "Dipoli",
                            "Korontière",
                            "Kossoucoingou",
                            "Manta",
                            "Natta",
                            "Tabota",
                            "Coblyé",
                            "Datori",
                            "Kountori",
                            "Tapoga",
                            "Brignamaro",
                            "Firou",
                            "Kérou",
                            "Koabagou",
                            "Birni",
                            "Chabi-Couma",
                            " Fô-Tancé",
                            "Guilmaro",
                            "Kouandé",
                            "Oroukayo",
                            "Dassari",
                            "Gouandé",
                            "Matéri",
                            "Nodi",
                            "Tantéga",
                            "Tchianhoun-Cossi",
                            "Kotopounga",
                            "Kouaba",
                            "Koundata",
                            "Natitingou I",
                            "Natitingou II",
                            "Natitingou III",
                            "Natitingou IV",
                            "Perma",
                            "Tchoumi-Tchoumi",
                            "Gnémasson",
                            "Péhunco",
                            "Tobré",
                            "Cotiakou",
                            "N'Dahonta",
                            "Taiakou",
                            "Tanguiéta",
                            "Tanongou",
                            "Kouarfa",
                            "Tampégré",
                            "Toucountouna",
                            "Abomey-Calavi",
                            "Akassato",
                            "Godomey",
                            "Glo-Djigbé",
                            "Hêvié",
                            "Kpanroun",
                            "Ouèdo",
                            "Togba",
                            "Zinvié",
                            "Agbanou",
                            "Ahouannonzoun",
                            "Allada",
                            "Attogon",
                            "Avakpa",
                            "Ayou",
                            "Hinvi",
                            "Lissègazoun",
                            "Lon-Agonmey",
                            "Sekou",
                            "Togoudo",
                            "Tokpa-Avagoudo",
                            "Aganmalomè",
                            "Agbanto",
                            "Agonkanmè",
                            "Dédomè",
                            "Dékanmè",
                            "Kpomassè",
                            "Sègbèya",
                            "Sègbohouè",
                            "Tokpa-Domè",
                            "Avlékété",
                            "Djègbadji",
                            "Gakpé",
                            "Houakpè-Daho",
                            "Ouidah I",
                            "Ouidah II",
                            "Ouidah III",
                            "Ouidah IV",
                            "Pahou",
                            "Savi",
                            "Ahomey-Lokpo",
                            "Dékanmey",
                            "Ganvié I",
                            "Ganvié II",
                            "Houédo-Aguékon",
                            "Sô-Ava",
                            "Vekky",
                            "Agué",
                            "Colli-Agbamè",
                            "Coussi",
                            "Damè",
                            "Djanglanmè",
                            "Houègbo",
                            "Kpomè",
                            "Sè",
                            "Sèhouè",
                            "Toffo-Agué",
                            "Avamè",
                            "Azohouè-Aliho",
                            "Azohouè-Cada",
                            "Tori-Bossito",
                            "Tori-Cada",
                            "Tori-Gare Tori aïdohoue",
                            "Tori acadjamè",
                            "Adjan",
                            " Dawè",
                            "Djigbé",
                            "Dodji-Bata",
                            "Hèkanmé",
                            "Koundokpoé",
                            "Sèdjè-Dénou",
                            "Sèdjè-Houégoudo",
                            "Tangbo-Djevié",
                            "Yokpo",
                            "Zè",
                            "Bembéréké",
                            "Béroubouay",
                            "Bouanri",
                            "Gamia",
                            "Ina",
                            "Basso",
                            "Bouka",
                            "Dérassi",
                            "Dunkassa",
                            "Kalalé",
                            "Péonga",
                            "Bori",
                            "Gbégourou",
                            "N'Dali",
                            "Ouénou",
                            "Sirarou",
                            "Biro",
                            "Gnonkourakali",
                            "Nikki",
                            "Ouénou",
                            "Sérékalé",
                            "Suya",
                            "Tasso",
                            "1er arrondissement de Parakou",
                            "2e arrondissement de Parakou",
                            "3e arrondissement de Parakou",
                            "Gninsy",
                            "Guinagourou",
                            "Kpané",
                            "Pébié",
                            "Pèrèrè",
                            "Sontou",
                            "Fô-Bourè",
                            "Sèkèrè",
                            "Sikki",
                            "Sinendé",
                            "Alafiarou",
                            "Bétérou",
                            "Goro",
                            "Kika",
                            "Sanson",
                            "Tchaourou",
                            "Tchatchou",
                            "Agoua",
                            "Akpassi",
                            "Atokoligbé",
                            "Bantè",
                            "Bobè",
                            "Gouka",
                            "Koko",
                            "Lougba",
                            "Pira",
                            "Akofodjoulè",
                            "Dassa I",
                            "Dassa II",
                            "Gbaffo",
                            "Kerè",
                            "Kpingni",
                            "Lèma",
                            "Paouignan",
                            "Soclogbo",
                            "Tré",
                            "Aklankpa",
                            "Assanté",
                            "Glazoué",
                            "Gomè",
                            "Kpakpaza",
                            "Magoumi",
                            "Ouèdèmè",
                            "Sokponta",
                            "Thio",
                            "Zaffé",
                            "Challa-Ogoi",
                            "Djègbè",
                            "Gbanlin",
                            "Kémon",
                            "Kilibo",
                            "Laminou",
                            "Odougba",
                            "Ouèssè",
                            "Toui",
                            "Djaloukou",
                            "Doumè",
                            "Gobada",
                            "Kpataba",
                            "Lahotan",
                            "Lèma",
                            "Logozohè",
                            "Monkpa",
                            "Ottola",
                            "Ouèssè",
                            "Savalou-aga",
                            "Savalou-agbado",
                            "Savalou-attakè",
                            "Tchetti",
                            "Adido",
                            "Bèssè",
                            "Boni",
                            "Kaboua",
                            "Ofè",
                            "Okpara",
                            "Plateau",
                            "Sakin",
                            "Aplahoué",
                            "Atomè",
                            "Azovè",
                            "Dekpo",
                            "Godohou",
                            "Kissamey",
                            "Lonkly",
                            "Adjintimey",
                            "Bètoumey",
                            "Djakotomey I",
                            "Djakotomey II",
                            "Gohomey",
                            "Houègamey",
                            "Kinkinhoué",
                            "Kokohoué",
                            "Kpoba",
                            "Sokouhoué",
                            "Ayomi",
                            "Dèvè",
                            "Honton",
                            "Lokogohoué",
                            " Madjrè",
                            "Tota",
                            "Totchagni",
                            "Adjanhonmè",
                            "Ahogbèya",
                            "Aya-Hohoué",
                            "Djotto",
                            "Hondji",
                            "Klouékanmè",
                            "Lanta",
                            "Tchikpé",
                            "Adoukandji",
                            "Ahondjinnako",
                            "Ahomadegbe",
                            "Banigbé",
                            "Gnizounmè",
                            "Hlassamè",
                            "Lalo",
                            "Lokogba",
                            "Tchito",
                            "Tohou",
                            "Zalli",
                            "Adjido",
                            "Avédjin",
                            "Doko",
                            "Houédogli",
                            "Missinko",
                            "Tannou-Gola",
                            "Toviklin",
                            "1er arrondissement de Cotonou",
                            "2e arrondissement de Cotonou",
                            "3e arrondissement de Cotonou",
                            "4e arrondissement de Cotonou",
                            "5e arrondissement de Cotonou",
                            "6e arrondissement de Cotonou",
                            "7e arrondissement de Cotonou",
                            "8e arrondissement de Cotonou",
                            "9e arrondissement de Cotonou",
                            "10e arrondissement de Cotonou, 11e arrondissement de Cotonou",
                            "12e arrondissement de Cotonou",
                            "13e arrondissement de Cotonou",
                            "Adohoun",
                            "Atchannou",
                            "Athiémé",
                            "Dédékpoé",
                            "Kpinnou",
                            "Agbodji",
                            "Badazoui",
                            "Bopa",
                            "Gbakpodji",
                            "Lobogo",
                            "Possotomè",
                            "Yégodoé",
                            "Agatogbo",
                            "Akodéha",
                            "Comè",
                            "Ouèdèmè-Pédah",
                            "Oumako",
                            "Adjaha",
                            "Agoué",
                            "Avloh",
                            "Djanglanmey",
                            "Gbéhoué",
                            "Grand-Popo",
                            "Sazoué",
                            "Dahé",
                            "Doutou",
                            "Honhoué",
                            "Houéyogbé",
                            "Sè",
                            "Zoungbonou",
                            "Agamé",
                            "Houin",
                            "Koudo",
                            "Lokossa",
                            "Ouèdèmè",
                            "Adjarra I",
                            "Adjarra II",
                            "Aglogbé",
                            "Honvié",
                            "Malanhoui",
                            "Médédjonou",
                            "Adjohoun",
                            "Akpadanou",
                            "Awonou",
                            "Azowlissè",
                            "Dèmè",
                            "Gangban",
                            "Kodè",
                            "Togbota",
                            "Avagbodji",
                            "Houédomè",
                            "Zoungamè",
                            "Akpro-Missérété",
                            "Gomè-Sota",
                            "Katagon",
                            "Vakon",
                            "Zodogbomey",
                            "Atchoukpa",
                            "Avrankou",
                            "Djomon",
                            "Gbozounmè",
                            "Kouty",
                            "Ouanho",
                            "Sado",
                            "Affamè",
                            "Atchonsa",
                            "Bonou",
                            "Damè-Wogon",
                            "Houinviguè",
                            " Arrondissements de Dangbo",
                            "Dangbo",
                            "Dèkin",
                            "Gbéko",
                            "Houédomey",
                            "Hozin",
                            "Késsounou",
                            "Zounguè",
                            "1er arrondissement",
                            "2e arrondissement",
                            "3e arrondissement",
                            "4e arrondissement",
                            "5e arrondissement",
                            "Agblangandan",
                            "Aholouyèmè",
                            "Djèrègbè",
                            "Ekpè",
                            "Sèmè-Kpodji",
                            "Tohouè",
                            "Adja-Ouèrè",
                            "Ikpinlè",
                            "Kpoulou",
                            "Massè",
                            "Oko-Akarè",
                            "Totonnoukon",
                            "Banigbé",
                            "Daagbé",
                            "Ifangni",
                            "Ko-Koumolou",
                            "Lagbé",
                            "Tchaada",
                            "Adakplamé",
                            "Idigny",
                            "Kpankou",
                            "Kétou",
                            "Odometa",
                            "Okpometa",
                            "Ahoyéyé",
                            "Igana",
                            "Issaba",
                            "Pobè",
                            "Towé",
                            "Aguidi",
                            "Ita-Djèbou",
                            "Sakété I",
                            "Sakété II",
                            "Takon",
                            "Yoko",
                            "Agbokpa",
                            "Dètohou",
                            "Djègbè",
                            "Hounli",
                            "Sèhoun",
                            "Vidolè",
                            "Zounzounmè",
                            "Adahondjigon",
                            "Adingningon",
                            "Agbangnizoun",
                            "Kinta",
                            "Kpota",
                            "Lissazounmè",
                            "Sahé",
                            "Siwé",
                            "Tanvé",
                            "Zoungoudo",
                            "Agongointo",
                            "Avogbanna",
                            "Bohicon I",
                            "Bohicon II",
                            "Gnidjazoun",
                            "Lissèzoun",
                            "Ouassaho",
                            "Passagon",
                            "Saclo",
                            "Sodohomè",
                            "Adogbé",
                            "Gounli",
                            "Houéko",
                            "Houen-Hounso",
                            "Lainta-Cogbè",
                            "Naogon",
                            "Soli",
                            "Zogba",
                            "Agondji",
                            "Agouna",
                            "Dan",
                            "Djidja",
                            "Dohouimè",
                            "Gobaix",
                            "Monsourou",
                            "Mougnon",
                            "Oungbègamè",
                            "Houto",
                            "Setto",
                            "Zoukon",
                            "Dasso",
                            "Ouinhi",
                            "Sagoné",
                            "Tohoué",
                            "Allahé",
                            "Assalin",
                            "Houngomey",
                            "Kpakpamè",
                            "Kpozoun",
                            "Za-Kpota",
                            "Za-Tanta",
                            "Zèko",
                            "Agonli-Houégbo",
                            "Banamè",
                            "N'-Tan",
                            "Dovi",
                            "Kpédékpo",
                            "Zagnanado",
                            "Akiza",
                            "Avlamè",
                            "Cana I",
                            "Cana II",
                            "Domè",
                            "Koussoukpa",
                            "Kpokissa",
                            "Massi",
                            "Tanwé-Hessou",
                            "Zogbodomey",
                            "Zoukou"
                          ].map((e) => e.toUpperCase()).toList(),
                          onChanged: (newValue) {
                            _provider.change_arrondissement(newValue!);
                          }),
                    ),
                  ]),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Votre nom",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: nom_controller,
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
                  gestion_commande.change_nom(value, nom_controller);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Adresse E-Mail",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: email.isEmpty || !email.contains("@")
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  gestion_commande.change_email(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Numero(Watsapp par préference)",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                  onTap: () {},
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 8,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: numero.isEmpty || numero.length < 8
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      counterText: "",
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    gestion_commande.change_numero(value);
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Que voulez-vous acheter ?",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                  onTap: () {},
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: achat.isEmpty || achat.length < 3
                              ? BorderSide(color: Colors.red)
                              : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    gestion_commande.change_achat(value);
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Descrivez la commande",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                  onTap: () {
                    _speak("Décrivez en détail la commande");
                  },
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              description.isEmpty || description.length < 10
                                  ? BorderSide(color: Colors.red)
                                  : BorderSide(color: Colors.blue)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    gestion_commande.change_description(value);
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date de livraison",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () async {
                  _speak(
                      "A quelle date voudriez vous que votre commande vous soit livrée");
                  DateTime? dateSelectionned = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  String formatime = dateSelectionned != null
                      ? DateFormat("dd-MM-yyyy").format(dateSelectionned)
                      : "";
                  if (formatime.isNotEmpty) {
                    date_livraison.text = formatime;
                  }
                },
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                controller: date_livraison,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Heure de livraison",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextFormField(
                  onTap: () async {
                    _speak(
                        "veuillez préciser l'heure de livraison de votre commande");
                    TimeOfDay? pickedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (pickedTime != null) {
                      DateTime? parsedTime = DateFormat.Hm()
                          .parse(pickedTime.format(context).toString());
                      String formatTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      heure_livraison.text = formatTime;
                    } else {
                      heure_livraison.text = "";
                    }
                  },
                  controller: heure_livraison,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black)),
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vos exigences pour cette commande(optionnel)",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                onTap: () {
                  _speak(
                      "Dites nous toutes vos exigences pour cette commande. Cette information n'est pas obligatoire");
                },
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: exigences_client.isEmpty ||
                                exigences_client.length < 3
                            ? BorderSide(color: Colors.red)
                            : BorderSide(color: Colors.blue)),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (value) {
                  gestion_commande.change_exigences(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Allez vous venir chercher votre commande ?",
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text(
                    "oui".toUpperCase(),
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: true,
                  groupValue: venir_chercher,
                  onChanged: (value) {
                    _provider.change_venir_chercher(value!);
                  },
                ),
                RadioListTile(
                  title: Text(
                    "non".toUpperCase(),
                    style: GoogleFonts.alike(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  groupValue: venir_chercher,
                  onChanged: (value) {
                    _provider.change_venir_chercher(value!);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            venir_chercher
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown.shade800),
                        onPressed: () async {
                          try {
                            _provider.affiche_true();

                            if (pays.isEmpty ||
                                nom.isEmpty ||
                                nom.length < 3 ||
                                email.isEmpty ||
                                email.length < 6 ||
                                numero.isEmpty ||
                                numero.length < 8 ||
                                achat.isEmpty ||
                                achat.length < 3 ||
                                description.isEmpty ||
                                description.length < 8 ||
                                date_livraison.text.isEmpty ||
                                heure_livraison.text.isEmpty) {
                              _provider.affiche_false();
                              _speak(
                                  "Certaines informations sont mal renseignées. Merci de corriger");

                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Toutes les informations renseignées ne sont pas correctes. Merci de corriger !",
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
                              final result = await FirebaseFirestore.instance
                                  .collection("clients")
                                  .where("email", isEqualTo: email)
                                  .get();
                              is_empty = result.docs.isEmpty;

                              if (is_empty) {
                                await FirebaseFirestore.instance
                                    .collection("clients")
                                    .doc(email)
                                    .set({
                                  "nombre_commande": 1,
                                  "email": email,
                                  "nom": nom.toUpperCase(),
                                  "numero": pays == "BENIN"
                                      ? "+229" + numero
                                      : "+228" + numero,
                                  "departement":
                                      pays == "BENIN" ? departement : "",
                                  "commune": pays == "BENIN" ? commu : "",
                                  "arrondissement":
                                      pays == "BENIN" ? arrondissement : "",
                                  "created_at": DateTime.now()
                                });

                                await FirebaseFirestore.instance
                                    .collection("commandes")
                                    .add({
                                  "heure_livraison": heure_livraison.text,
                                  "traite": false,
                                  "client_uid": email,
                                  "achat": "achat de " + achat,
                                  "description": description,
                                  "exigences": exigences_client,
                                  "date_livraison": date_livraison.text,
                                  "venir_chercher_commande": venir_chercher,
                                  "supporter_frais_transport": false,
                                  "created_at": DateTime.now(),
                                  "updated_at": DateTime.now(),
                                  "coordonnees_gps": "",
                                  "indication": ""
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("clients")
                                    .doc(email)
                                    .get()
                                    .then((DocumentSnapshot document) {
                                  nombre = (document.data()
                                      as Map)['nombre_commande'];
                                });
                                nombre += 1;
                                await FirebaseFirestore.instance
                                    .collection("clients")
                                    .doc(email)
                                    .update({"nombre_commande": nombre});

                                await FirebaseFirestore.instance
                                    .collection("commandes")
                                    .add({
                                  "heure_livraison": heure_livraison.text,
                                  "traite": false,
                                  "client_uid": email,
                                  "achat": "achat de " + achat,
                                  "description": description,
                                  "exigences": exigences_client,
                                  "date_livraison": date_livraison.text,
                                  "venir_chercher_commande": venir_chercher,
                                  "supporter_frais_transport": false,
                                  "created_at": DateTime.now(),
                                  "updated_at": DateTime.now(),
                                  "coordonnees_gps": "",
                                  "indication": ""
                                });
                              }
                              String username = 'agripiyalo@gmail.com';
                              String _password = 'ghcaxojthaqzmhdc';

                              final smtpServer = gmail(username, _password);
                              // Use the SmtpServer class to configure an SMTP server:
                              // final smtpServer = SmtpServer('smtp.domain.com');
                              // See the named arguments of SmtpServer for further configuration
                              // options.

                              // Create our message.
                              final message = Message()
                                ..from =
                                    Address(username, 'Agri Pitalo Entreprise')
                                ..recipients.add(email.trim())
                                ..ccRecipients
                                //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                                //..bccRecipients.add(Address('bccAddress@example.com'))
                                ..subject = "Commande passée"
                                ..text = " " +
                                    nom +
                                    " \n Votre commande a été enregistrée avec succès. Elle sera prete avant la date de livraison que vous avez démandée. Nous vous garantissons aussi de prendre en compte toutes vos exigences. \n Merci pour la confiance, cher client";
                              //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                              final sendReport =
                                  await send(message, smtpServer);

                              _provider.affiche_false();
                              _speak(
                                  "Votre commande a été enregistrée avec succès");

                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Commande enregistrée avec succès",
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snakbar);
                            }
                          } catch (e) {
                            _provider.affiche_false();
                            _speak(
                                "Une erreur inattendue est survenue. Merci de réessayer");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  /*"Une erreur inattendue s'est produite !!"*/ e
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
                                color: Colors.cyan,
                              )
                            : Text(
                                "Lancer la commande".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          try {
                            _provider.affiche_true();

                            if (pays.isEmpty ||
                                nom.isEmpty ||
                                nom.length < 3 ||
                                email.isEmpty ||
                                email.length < 6 ||
                                numero.isEmpty ||
                                numero.length < 8 ||
                                achat.isEmpty ||
                                achat.length < 3 ||
                                description.isEmpty ||
                                description.length < 8 ||
                                date_livraison.text.isEmpty) {
                              _provider.affiche_false();
                              _speak(
                                  "Certaines informations sont mal renseignées. Merci de corriger");

                              final snakbar = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Toutes les informations renseignées ne sont pas correctes. Merci de corriger !",
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
                              _provider.affiche_false();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommanderSecondPage(
                                          heure_livraison: heure_livraison.text,
                                          pays: pays,
                                          departement: departement,
                                          commune: commu,
                                          arrondissement: arrondissement,
                                          nom: nom,
                                          email: email,
                                          numero: numero,
                                          achat: achat,
                                          description: description,
                                          exigences_cllient: exigences_client,
                                          date_livraison: date_livraison.text,
                                          venir_chercher: venir_chercher)));
                            }
                          } catch (e) {
                            _provider.affiche_false();
                            _speak(
                                "Une erreur inattendue est survenue. Merci de réessayer");

                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Une erreur inattendue s'est produite !!",
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
                        child: Text(
                          "Finaliser la commande".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.brown.shade800,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
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
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
