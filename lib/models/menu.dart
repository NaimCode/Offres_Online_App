import 'package:flutter/material.dart';

class Menu {
  String titre;
  IconData? icon;
  String route;
  Menu({
    required this.titre,
    this.icon,
    required this.route,
  });
}
