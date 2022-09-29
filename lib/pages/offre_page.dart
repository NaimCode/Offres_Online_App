import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offres_onlines/widgets/inDevelopment.dart';

import '../models/offre.dart';

class OffrePage extends StatefulWidget {
  const OffrePage({super.key});

  @override
  State<OffrePage> createState() => _OffrePageState();
}

class _OffrePageState extends State<OffrePage> {
  late Offre offre;

  @override
  void initState() {
    super.initState();
    offre = Get.arguments;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              tooltip: 'Exporter',
              splashRadius: 22,
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.filePdf)),
          ValueListenableBuilder(
            valueListenable: Hive.box('favoris').listenable(),
            builder: (context, box, widget) {
             
              bool isFav=box.values.contains(offre.mrchId);
              return IconButton(
                  tooltip: isFav
                      ? 'Ajouter au favori'
                      : "Retirer des favoris",
                  splashRadius: 22,
                  onPressed: () {
                    if(isFav){
                     // Get.rawSnackbar(title:"Favoris", message: "L'offre ne fait plus de mes favoris",icon: const FaIcon(FontAwesomeIcons.circleExclamation));
                      box.deleteAt(box.values.toList().indexWhere((element) => element==offre.mrchId));
                    }else{
                     //Get.rawSnackbar(title:"Favoris",message: "Vous avez ajouté cet offre à mes favoris",icon: const FaIcon(FontAwesomeIcons.check));
                      box.add(offre.mrchId);
                    }
                  },
                  icon: FaIcon(
                    !isFav
                        ? FontAwesomeIcons.star
                        : FontAwesomeIcons.solidStar,
                    color: !isFav? null : Colors.yellow,
                  ));
            },
          )
        ],
      ),
      body: const InDevelopment(),
    );
  }
}
