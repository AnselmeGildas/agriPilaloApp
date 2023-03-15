// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_const_constructors_in_immutables, must_be_immutable, unused_local_variable, non_constant_identifier_names, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, deprecated_member_use, unused_import
import 'package:deogracias/base_donne/servicebasededonnees.dart';
import 'package:deogracias/interface/loading.dart';
import 'package:deogracias/interface/provider_format_timestamp.dart';
import 'package:deogracias/interface/provider_new_pawword.dart';
import 'package:deogracias/interface/provider_traiter_commande.dart';
import 'package:deogracias/modele/achat_poussins.dart';
import 'package:deogracias/modele/appreciations.dart';
import 'package:deogracias/modele/assistances.dart';
import 'package:deogracias/modele/betes.dart';
import 'package:deogracias/modele/budget.dart';
import 'package:deogracias/modele/client.dart';
import 'package:deogracias/modele/commandes.dart';
import 'package:deogracias/modele/depense.dart';
import 'package:deogracias/modele/fientes.dart';
import 'package:deogracias/modele/oeuf_table.dart';
import 'package:deogracias/modele/pertes.dart';
import 'package:deogracias/modele/poussins.dart';
import 'package:deogracias/modele/problemes.dart';
import 'package:deogracias/modele/services.dart';
import 'package:deogracias/modele/vagues.dart';
import 'package:deogracias/modele/vente_betes.dart';
import 'package:deogracias/modele/vente_oeuf_tables.dart';
import 'package:deogracias/modele/ventes_a_credits.dart';
import 'package:deogracias/modele/ventes_fientes.dart';
import 'package:deogracias/provider/provider_achat_poussin.dart';
import 'package:deogracias/provider/provider_apprecier.dart';
import 'package:deogracias/provider/provider_assistance.dart';
import 'package:deogracias/provider/provider_connexion.dart';
import 'package:deogracias/provider/provider_create_account.dart';
import 'package:deogracias/provider/provider_depense.dart';
import 'package:deogracias/provider/provider_drawer_admin.dart';
import 'package:deogracias/provider/provider_drawer_client.dart';
import 'package:deogracias/provider/provider_drawer_user.dart';
import 'package:deogracias/provider/provider_enregister_probleme.dart';
import 'package:deogracias/provider/provider_gestion_commande.dart';
import 'package:deogracias/provider/provider_gestion_departement.dart';
import 'package:deogracias/provider/provider_historique_vente.dart';
import 'package:deogracias/provider/provider_message_client.dart';
import 'package:deogracias/provider/provider_nouvelle_bete.dart';
import 'package:deogracias/provider/provider_nouvelle_vague.dart';
import 'package:deogracias/provider/provider_peret.dart';
import 'package:deogracias/provider/provider_poussin_mort_retablie.dart';
import 'package:deogracias/provider/provider_profil.dart';
import 'package:deogracias/provider/provider_recharger_fiente.dart';
import 'package:deogracias/provider/provider_recharger_oeuf.dart';
import 'package:deogracias/provider/provider_recharger_stock_bete.dart';
import 'package:deogracias/provider/provider_recherche_commande_client.dart';
import 'package:deogracias/provider/provider_search.dart';
import 'package:deogracias/provider/provider_service.dart';
import 'package:deogracias/provider/provider_signaler_bete.dart';
import 'package:deogracias/provider/provider_signaler_bete_mort_retablie.dart';
import 'package:deogracias/provider/provider_signaler_oeuf_casse.dart';
import 'package:deogracias/provider/provider_signaler_poussin.dart';
import 'package:deogracias/provider/provider_vente_a_credit.dart';
import 'package:deogracias/provider/provider_vente_bete.dart';
import 'package:deogracias/provider/provider_vente_fiente.dart';
import 'package:deogracias/provider/provider_vente_oeuf.dart';
import 'package:deogracias/provider/reset_password_provider.dart';
import 'package:deogracias/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/registration.dart';

// ignore: import_of_legacy_library_into_null_safe

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({key}) : super(key: key);
  String uid = "";

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return MultiProvider(
      providers: [
        Provider<firebaseAuth>(
          create: (_) => firebaseAuth(),
        ),
        Provider<serviceBD>(create: (_) => serviceBD()),
        StreamProvider(
            create: (context) => context.read<firebaseAuth>().utilisateur,
            initialData: null),
        StreamProvider(
            create: (context) => context.read<serviceBD>().currentuserdata,
            initialData: donnesUtilisateur(
                nom: "",
                prenom: "",
                email: "",
                telephone: "",
                role: "",
                sexe: "",
                date_naissance: "",
                uid: uid,
                photo_url: "",
                admin: false,
                is_active: false,
                mdp: "",
                date_inscription: "",
                deleted: false)),
        StreamProvider(
            create: (context) => context.read<serviceBD>().list_des_clients,
            initialData: <Clients>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().list_des_utilisateur,
            initialData: <donnesUtilisateur>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().toutes_les_commandes,
            initialData: <Commandes>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().budget,
            initialData: Budget(uid: "", solde_total: 0, depense: 0, perte: 0)),
        StreamProvider(
            create: (context) =>
                context.read<serviceBD>().list_des_appreciations,
            initialData: <Appreciations>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().list_des_vagues,
            initialData: <Vagues>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().list_des_problemes,
            initialData: <Problemes>[]),
        StreamProvider(
            create: (context) => context.read<serviceBD>().list_des_services,
            initialData: <Services>[]),
        ChangeNotifierProvider(create: (context) => ProviderConnexion()),
        ChangeNotifierProvider(
            create: (context) => ProviderGestionDepartement()),
        ChangeNotifierProvider(create: (context) => ProviderGestionCommande()),
        ChangeNotifierProvider(
            create: (context) => ProviderRechercheCommandeClient()),
        ChangeNotifierProvider(create: (context) => Search()),
        ChangeNotifierProvider(create: (context) => providerCreateAccount()),
        ChangeNotifierProvider(create: (context) => ProviderResetPassword()),
        ChangeNotifierProvider(create: (context) => ProviderDrawerAdmin()),
        ChangeNotifierProvider(
          create: (context) => ProviderNouvelleBete(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderDepense(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderPerte(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderVenteBete(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderVenteOeufTable(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderVenteFiente(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderRechargerStockBete(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderRechargerFiente(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderRechargerOeufTables(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderAchatPoussin(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSignalerPoussin(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderHistoriqueVente(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSignalerBete(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSignalerOeufCasse(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderDrawerClient(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderApprecierNosServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderFormatTimestamp(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderTraiterCommande(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderMessageClient(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderNewPassword(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderProfil(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderAssistance(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderEnregistrerProbleme(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderVenteACredit(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderDrawerUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSignalerPoussinMortRetabli(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSignalerBeteMortRetablie(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderNouvelleVague(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Loading(),
      ),
    );
  }
}
