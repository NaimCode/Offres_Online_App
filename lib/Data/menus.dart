// ignore_for_file: non_constant_identifier_names

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/menu.dart';

List<Menu> MENUS=[
  Menu(titre: 'Avis rectification', route: "/avis_rectification",icon: FontAwesomeIcons.solidBell),
  Menu(titre: 'Favoris', route: "/favoris",icon:FontAwesomeIcons.solidStar),
  Menu(titre: "Appels d'offres du jour", route: "/appels_offres_jour"),
  Menu(titre: "Appels d'offres publics", route: "/appels_offres_public"),
  Menu(titre: "Appels d'offres privés", route: "/appels_offres_prives"),
  Menu(titre: "DCE en ligne", route: "/dce_enligne"),
  Menu(titre: "Archive d'appels d'offres", route: "/archives_appels_offres"),
  Menu(titre: "Appels d'offres Afrique", route: "/appels_offres_afrique"),
];