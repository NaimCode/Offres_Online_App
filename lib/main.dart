// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import 'package:offres_onlines/bloc/offre/offre_bloc.dart';
import 'package:offres_onlines/pages/offre_page.dart';
import 'package:offres_onlines/pages/profil.dart';
import 'package:offres_onlines/repository/offre_repository.dart';
import 'package:offres_onlines/widgets/error.dart';
import 'package:offres_onlines/widgets/inDevelopment.dart';
import 'package:offres_onlines/widgets/loading.dart';

import 'bloc/data/data_bloc.dart';
import 'config/theme.dart';
import 'pages/appels_offres_jour.dart';
import 'partials/layout.dart';
import 'repository/data_repository.dart';

void main() async {
  await Intl.withLocale('fr', () => print('init intl to fr'));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OffreBloc>(
            create: (context) => OffreBloc(offreRepository: OffreRepository())),
        BlocProvider<DataBloc>(
            create: (context) =>
                DataBloc(dataRepository: DataRepository())..add(DataInit()))
      ],
      child: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataIsLoading) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(body: Center(child: Loading())));
          }
          if (state is DataError) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                    body: Error(text: 'Impossible de récuperer les données')));
          }
          if (state is DataGetAll) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: THEME,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('fr', 'FR')],
              initialRoute: "/avis_rectification",
              routingCallback: (routing) {
                //Manage routing
              },
              getPages: [
                GetPage(
                    name: "/",
                    page: () => const Layout(content: InDevelopment())),
                GetPage(name: "/settings", page: () => const Profil()),
                GetPage(name: "/offre", page: () => const OffrePage()),
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
            );
          }
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(body: Loading()));
        },
      ),
    );
  }
}
