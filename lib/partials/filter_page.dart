import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/bloc/data/data_bloc.dart';
import 'package:offres_onlines/config/theme.dart';
import 'package:offres_onlines/models/activite.dart';
import 'package:offres_onlines/models/organisme.dart';
import 'package:offres_onlines/models/ville.dart';
import 'package:offres_onlines/partials/select.dart';


class FilterPage extends StatefulWidget {
  const FilterPage({super.key,required this.activites,required this.organismes,required this.villes});
 final List<Ville> villes;
final  List<Organisme> organismes;
final  List<Activite> activites;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late List<Ville> villes;
  late List<Organisme> organismes;
  late List<Activite> activites;

  late DataGetAll data;
  
  @override
  void initState() {
    super.initState();
    villes = widget.villes;
    organismes = widget.organismes;
    activites = widget.activites;

    data = BlocProvider.of<DataBloc>(Get.context!).state as DataGetAll;

  }

void clear(){
  setState(() {
    activites.clear();
    villes.clear();
    organismes.clear();
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          child: Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 40),
                    textStyle: const TextStyle(fontSize: 18)),
                onPressed: () {
                  Get.back(result: {'filter': 100, 'prix': 4000});
                },
                child: const Text('Valider')),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: PRIMARY_COLOR,
        title: const Text('Filtrer'),
        centerTitle: false,
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor),
              onPressed: () =>clear(),
              icon: const FaIcon(FontAwesomeIcons.eraser, size: 20),
              label: const Text(
                'Effacer',
                style: TextStyle(fontSize: 17),
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Divider(),
          ListTile(
            onTap: () async {
              List<int> results = await Get.to(() => Select(
                  list: data.activites,
                  selectedList: activites.map((e) => e.activId!).toList(),
                  field: (e) => e.activLabel,
                  id: (e) => e.activId));

              setState(() {
                activites = results
                    .map((e) => data.activites
                        .firstWhere((element) => element.activId == e))
                    .toList();
              });
            },
            iconColor: PRIMARY_COLOR,
            leading: const FaIcon(FontAwesomeIcons.briefcase),
            title: const Text('Activités'),
            trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            subtitle: Wrap(
              spacing: 2,
              children: activites.isEmpty
                  ? [
                      Chip(
                          labelStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.brown.shade700),
                          label: const Text('Toutes les activités'))
                    ]
                  : activites
                      .map((e) => Chip(
                          onDeleted: () {
                            setState(() {
                              activites.remove(e);
                            });
                          },
                          labelStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.brown.shade700),
                          label: Text(e.activLabel!)))
                      .toList(),
            ),
          ),
          const Divider(),
          ListTile(
              onTap: () async {
                List<int> results = await Get.to(() => Select(
                    list: data.organimes,
                    selectedList: organismes.map((e) => e.id!).toList(),
                    field: (e) => e.orgLabel,
                    id: (e) => e.id));

                setState(() {
                  organismes = results
                      .map((e) => data.organimes
                          .firstWhere((element) => element.id == e))
                      .toList();
                });
              },
              iconColor: PRIMARY_COLOR,
              leading: const FaIcon(FontAwesomeIcons.building),
              title: const Text('Organismes'),
              trailing: const FaIcon(FontAwesomeIcons.chevronRight),
              subtitle: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: organismes.isEmpty
                    ? [
                        Chip(
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.brown.shade700),
                            label: const Text('Toutes les organismes'))
                      ]
                    : organismes
                        .map((e) => Chip(
                            onDeleted: () {
                              setState(() {
                                organismes.remove(e);
                              });
                            },
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.brown.shade700),
                            label: Text(e.orgLabel!)))
                        .toList(),
              )),
          const Divider(),
          ListTile(
              onTap: () async {
                List<int> results = await Get.to(() => Select(
                    list: data.villes,
                    selectedList: villes.map((e) => e.villId!).toList(),
                    field: (e) => e.villLabel,
                    id: (e) => e.villId));

                setState(() {
                  villes = results
                      .map((e) => data.villes
                          .firstWhere((element) => element.villId == e))
                      .toList();
                });
              },
              iconColor: PRIMARY_COLOR,
              leading: const FaIcon(FontAwesomeIcons.locationDot),
              title: const Text('Villes'),
              trailing: const FaIcon(FontAwesomeIcons.chevronRight),
              subtitle: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: villes.isEmpty
                    ? [
                        Chip(
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.brown.shade700),
                            label: const Text('Toutes les villes'))
                      ]
                    : villes
                        .map((e) => Chip(
                          
                            onDeleted: () {
                              setState(() {
                                villes.remove(e);
                              });
                            },
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.brown.shade700),
                            label: Text(e.villLabel!)))
                        .toList(),
              )),
          const Divider(),
        ],
      ),
    );
  }
}
