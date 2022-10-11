import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/partials/main_drawer.dart';
import 'package:offres_onlines/widgets/brand.dart';
import 'package:offres_onlines/widgets/open_drawer.dart';


class Layout extends StatefulWidget {
  final Widget content;
  const Layout({super.key,required this.content});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
         title: const Brand(),
         centerTitle: true,
          leading: const OpenDrawerButton(),
          actions:  [
            IconButton(
              tooltip: 'Profil',
             splashRadius: 22,
              onPressed: ()=>Get.toNamed("/settings"), icon: const FaIcon(FontAwesomeIcons.solidUser))
          ],
        ),
        drawer: const MainDrawer(),
        body: widget.content,
     
      );
  }
}