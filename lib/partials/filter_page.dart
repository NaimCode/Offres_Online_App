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
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late List<Ville> villes;
  late List<Organisme> organismes;
  late List<Activite> activites;
 
  late DataGetAll data;
  @override
  void initState(){
    super.initState();
    villes = [];
    organismes = [];
    activites = [];

   data= BlocProvider.of<DataBloc>(Get.context!).state as DataGetAll;

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
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: const TextStyle(fontSize: 18)),
                onPressed: () {
                  Get.back(result: {'filter': 100, 'prix': 4000});
                },
                child: const Text('Rechercher')),
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
              onPressed: () {},
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
            onTap: ()async{
            List<int> results=  await Get.to(()=>Select(list: data.activites,selectedList:activites.map((e) => e.activId!).toList(), field: (e)=>e.activLabel,id:(e)=>e. activId));
             
             setState(() {
               activites=results.map((e) => data.activites.firstWhere((element) => element.activId==e)).toList();
             });
            },
            iconColor: PRIMARY_COLOR,
            leading: const FaIcon(FontAwesomeIcons.briefcase),
            title: const Text('Activités'),
            trailing: const FaIcon(FontAwesomeIcons.chevronRight),
            subtitle: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: activites.isEmpty
                  ? [
                      Chip(
                          labelStyle: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.brown.shade700),
                          label: const Text('Toutes les activités'))
                    ]
                  : [],
            ),
          ),
          const Divider(),
          ListTile(
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
                      : [])),
          const Divider(),
          ListTile(
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
                      : [])),
          const Divider(),
        ],
      ),
    );
  }
}
