// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:offres_onlines/models/activite.dart';
import 'package:offres_onlines/models/organisme.dart';
import 'package:offres_onlines/models/ville.dart';

import 'package:offres_onlines/utils/functions.dart';

import '../models/pays.dart';

class DataRepository {
  Future<Map<String, dynamic>> fakerData() async {
    List<Ville> villes = [];
    List<Pays> pays = [];
    List<Activite> activites = [];
    List<Organisme> organismes = [];
    await Future.delayed(const Duration(seconds: 1), () async {
      List<dynamic> tempVilles =
          json.decode(await getJson(file: 'server/villes.json'));
      villes.addAll(tempVilles.map((e) => Ville.fromJson(e)));
      List<dynamic> tempOrganisme =
          json.decode(await getJson(file: 'server/organismes.json'));
      organismes.addAll(tempOrganisme.map((e) => Organisme.fromJson(e)));

      List<dynamic> tempPays =
          json.decode(await getJson(file: 'server/pays.json'));
      pays.addAll(tempPays.map((e) => Pays.fromJson(e)));
      List<dynamic> tempActivites =
          json.decode(await getJson(file: 'server/activites.json'));
      activites.addAll(tempActivites.map((e) => Activite.fromJson(e)));
    });

    Map<String, dynamic> result = {
      'villes': villes,
      'organismes': organismes,
      'activites': activites,
      'pays': pays
    };
    return result;
  }
}
