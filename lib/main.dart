// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import 'package:offres_onlines/bloc/offre/offre_bloc.dart';
import 'package:offres_onlines/pages/offre_page.dart';
import 'package:offres_onlines/pages/profil.dart';
import 'package:offres_onlines/repository/offre_repository.dart';
import 'package:offres_onlines/widgets/inDevelopment.dart';

import 'config/theme.dart';
import 'pages/appels_offres_jour.dart';
import 'partials/layout.dart';

void main() async{
  await Intl.withLocale('fr', () => print('init intl to fr'));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OffreBloc>(
      create: (context) => OffreBloc(offreRepository: OffreRepository()),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: THEME,
        initialRoute: "/avis_rectification",
        routingCallback: (routing) {
          //Manage routing
        },
        getPages: [
          GetPage(
              name: "/", page: () => const Layout(content: InDevelopment())),
          GetPage(name: "/settings", page: ()=>const  Profil()),
          GetPage(name: "/offre", page: ()=>const  OffrePage()),
          GetPage(
              name: "/avis_rectification",
              page: () => const Layout(content: InDevelopment())),
          GetPage(
              name: "/favoris",
              page: () => const Layout(content: InDevelopment())),
          GetPage(
              name: "/appels_offres_jour",
              page: () => const Layout(content: AppelsOffresJour())),
          GetPage(
              name: "/appels_offres_prives",
              page: () => const Layout(content: InDevelopment())),
          GetPage(
              name: "/dce_enligne",
              page: () => const Layout(content: InDevelopment())),
          GetPage(
              name: "/archives_appels_offres",
              page: () => const Layout(content: InDevelopment())),
          GetPage(
              name: "/appels_offres_afrique",
              page: () => const Layout(content: InDevelopment())),
        ],
      ),
    );
  }
}
