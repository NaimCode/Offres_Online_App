import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/partials/filter_page.dart';
import 'package:offres_onlines/widgets/Loading.dart';
import 'package:offres_onlines/widgets/error.dart';

import '../bloc/offre/offre_bloc.dart';

class AppelsOffresJour extends StatefulWidget {
  const AppelsOffresJour({super.key});

  @override
  State<AppelsOffresJour> createState() => _AppelsOffresJourState();
}

class _AppelsOffresJourState extends State<AppelsOffresJour> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OffreBloc>(Get.context!).add(OffreEventGetAll());
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Appels d'offres du jour",
                    style: Theme.of(context).textTheme.headline6),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColor,
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    onPressed: () async {
                      await Get.to(() => const FilterPage());
                    },
                    icon: const FaIcon(FontAwesomeIcons.filter, size: 17),
                    label: const Text('Filtrer'))
              ],
            ),
          ),
          BlocBuilder<OffreBloc, OffreState>(builder: (context, state) {
            if (state is OffreIsLoading) {
              return const Loading();
            } 
            if (state is OffreError) {
              return const Error(text: 'Impossible de charger les donnés');
            } 
            if (state is OffreData) {
              return  Center(child: Text("résultat : ${state.offres.length}"));
            }
            return Container();
          })
        ],
      ),
    );
  }
}
