import 'package:offres_onlines/models/pays.dart';
import 'package:offres_onlines/models/ville.dart';
import 'package:offres_onlines/utils/conversion.dart';

import 'activite.dart';
import 'organisme.dart';

class Filter {
  late List<Organisme> organismes;
  late List<Pays>? pays;
  late List<Activite> activites;
  late List<Ville> villes;
  late DateTime? date;
  Filter.empty() {
    organismes = [];
    pays = [];
    date = DateTime.now();
    activites = [];
    villes = [];
  }
  Filter({
    required this.organismes,
    required this.date,
    this.pays,
    required this.activites,
    required this.villes,
  });


  bool noFilter() {
    return organismes.isEmpty &&
        villes.isEmpty &&
        activites.isEmpty && isToday(date: date);
  }
}
