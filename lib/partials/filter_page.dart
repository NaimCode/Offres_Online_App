import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/bloc/data/data_bloc.dart';
import 'package:offres_onlines/config/theme.dart';
import 'package:offres_onlines/models/activite.dart';
import 'package:offres_onlines/models/filter.dart';
import 'package:offres_onlines/models/organisme.dart';
import 'package:offres_onlines/models/ville.dart';
import 'package:offres_onlines/partials/select.dart';

import '../utils/conversion.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key, required this.filter});
  final Filter filter;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late List<Ville> villes;
  late List<Organisme> organismes;
  late List<Activite> activites;
  late DateTime? date;
  late DataGetAll data;

  @override
  void initState() {
    super.initState();
    villes = widget.filter.villes;
    organismes = widget.filter.organismes;
    activites = widget.filter.activites;
    date = widget.filter.date;
    data = BlocProvider.of<DataBloc>(Get.context!).state as DataGetAll;
  }

  void clear() {
    setState(() {
      activites.clear();
      villes.clear();
      organismes.clear();
      date=null;
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
                  Get.back(
                      result: Filter(
                          organismes: organismes,
                          activites: activites,
                          villes: villes,
                          date: date));
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
              onPressed: () => clear(),
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
          ListTile(
            onTap: () async {
              DateTime? result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 740)),
                  lastDate: DateTime.now());
              if (result != null) {
                setState(() {
                  date = result;
                });
              }
            },
            iconColor: PRIMARY_COLOR,
            leading: const FaIcon(FontAwesomeIcons.calendarDay),
            title: const Text('Date'),
            subtitle: Row(
              children: [
                Chip(
                    onDeleted: isToday(date: date)
                        ? null
                        : () {
                            setState(() {
                              date = null;
                            });
                          },
                    labelStyle: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.brown.shade700),
                    label: Text(dateHumanFormat(date: date))),
              ],
            ),
            trailing: const FaIcon(FontAwesomeIcons.chevronRight),
          ),
        ],
      ),
    );
  }
}


//  DatePickerDialog(
//             initialEntryMode: DatePickerEntryMode.input,
//             initialDate: DateTime.now(), firstDate: DateTime.now().subtract(const Duration(days: 365)), lastDate: DateTime.now())