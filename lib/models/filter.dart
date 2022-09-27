import 'package:offres_onlines/models/pays.dart';
import 'package:offres_onlines/models/ville.dart';

import 'activite.dart';
import 'organisme.dart';

class Filter{
 late List<Organisme> organismes;
 late List<Pays>? pays;
 late List<Activite> activites;
 late List<Ville> villes;

  Filter.empty(){
    organismes=[];
    pays=[];
    activites=[];
    villes=[];
  }
  Filter({
    required this.organismes,
    this.pays,
    required this.activites,
    required this.villes,
  });
}