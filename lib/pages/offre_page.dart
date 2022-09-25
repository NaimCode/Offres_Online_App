import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../models/offre.dart';

class OffrePage extends StatefulWidget {
  const OffrePage({super.key});

  @override
  State<OffrePage> createState() => _OffrePageState();
}

class _OffrePageState extends State<OffrePage> {
 late Offre offre;
  late Rx<bool> isFav;
  @override
  void initState() {
    super.initState();
    offre=Get.arguments;
    isFav=false.obs;
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
           IconButton(
             splashRadius: 22,
              onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.filePdf)),
          Obx(()=> IconButton(
             splashRadius: 22,
              onPressed: (){
                isFav.value=!isFav.value;
              }, icon:  FaIcon(isFav.isFalse? FontAwesomeIcons.star:FontAwesomeIcons.solidStar,color: isFav.isFalse?null:Colors.yellow,)))
        ],
      ),
    );
  }
}