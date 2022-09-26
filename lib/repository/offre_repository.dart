// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:offres_onlines/models/offre.dart';

import 'package:offres_onlines/utils/functions.dart';

import '../models/pays.dart';

class OffreRepository {
  Future<List<Offre>> fakerOffres() async {
    List<Offre> data = [];
    List<Pays> pays = [];
    await Future.delayed(const Duration(seconds: 2), () async {
      List<dynamic> temp =
          json.decode(await getJson(file: 'server/AoDuJours.json'));
      data.addAll(temp.map((e) => Offre.fromJson(e)));
   
      pays.addAll(await fakerPays());
    });
    return data.map((offre) {
      offre.pays = pays.firstWhere((p) => offre.idPays == p.id);
      return offre;
    }).toList();
  }

  Future<List<Pays>> fakerPays() async {
    List<Pays> pays = [];
    List<dynamic> tempPays =
        json.decode(await getJson(file: 'server/pays.json'));
    pays.addAll(tempPays.map((e) => Pays.fromJson(e)));
    return pays;
  }
}
