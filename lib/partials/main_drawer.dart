import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/Data/menus.dart';

import '../models/menu.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
          itemCount: MENUS.length,
          itemBuilder: (context, index) {
            Menu menu = MENUS[index];
            bool selected = Get.currentRoute == menu.route;
            return ListTile(
              onTap: () => Get.toNamed(menu.route),
              selected: selected,
              leading: FaIcon(menu.icon),
              title: Text(menu.titre),
            );
          }),
    );
  }
}
