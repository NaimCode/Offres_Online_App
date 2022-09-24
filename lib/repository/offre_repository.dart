// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:offres_onlines/models/offre.dart';
import 'package:offres_onlines/utils/functions.dart';

class OffreRepository {

  Future<List<Offre>> fakerOffres() async {
    List<Offre> data = [];
    await Future.delayed(const Duration(seconds: 2), () async {
      List<dynamic> temp =
          json.decode(await getJson(file: 'server/AoDuJours.json'));
      data.addAll(temp.map((e) => Offre.fromJson(e)));
    });
    return data;
  }
}
