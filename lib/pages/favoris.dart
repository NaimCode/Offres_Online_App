import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offres_onlines/widgets/error.dart';

import '../bloc/favoris/favoris_bloc.dart';
import '../models/offre.dart';
import '../widgets/Loading.dart';
import '../widgets/no_data.dart';
import 'appels_offres_jour.dart';

class Favoris extends StatefulWidget {
  const Favoris({super.key});

  @override
  State<Favoris> createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  RxString search=''.obs;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: Hive.box('favoris').listenable(), builder: (context, box, child){
      BlocProvider.of<FavorisBloc>(context).add(FavorisGet(ids: box.values.toList()));
      return ListView(
        children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        search.value = value.toLowerCase();
                      },
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                          hintText: "Recherche",
                          suffixIcon: SizedBox(
                              width: double.minPositive,
                              child: Center(
                                  child: FaIcon(FontAwesomeIcons.magnifyingGlass,
                                      size: 20))),
                          filled: true,
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(width: 10),
                   IconButton(
              tooltip: 'Effacer',
             splashRadius: 22,
              onPressed: ()=>box.clear(), icon: const FaIcon(FontAwesomeIcons.solidTrashCan,color: Colors.red,))
                ],
              ),
            ),
            const Divider(),
          BlocBuilder<FavorisBloc, FavorisState>(builder: (context, state) {
                  if (state is FavorisLoading) {
                    return const Loading();
                  }
                  if (state is FavorisError) {
                    return const Error(text: 'Impossible de charger les donnés');
                  }
                  if (state is FavorisData) {
                    return Obx(() => state.data(searchText: search.value).isEmpty
                        ? const NoData()
                        : ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.amber.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                              "${state.data(searchText: search.value).length} appels d'offres"),
                                        )
                                      ]),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        state.data(searchText: search.value).length,
                                    itemBuilder: ((context, index) {
                                      Offre offre = state.data(
                                          searchText: search.value)[index];
                                      return OffreCard(offre: offre);
                                    })),
                              ]));
                  }

                  return Container();
                }),
        ],
      );
    });
  }
}