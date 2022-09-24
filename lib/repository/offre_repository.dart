// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:offres_onlines/models/offre.dart';
import 'package:offres_onlines/utils/functions.dart';

class OffreRepository{

  Future<List<Offre>> fakerOffres()async{
    var data;
    Future.delayed(const Duration(seconds: 2),() async{
      data=json.decode(await getJson(file: 'AoDuJours.json'));
    print(data);
    });
    return [];
  }
}