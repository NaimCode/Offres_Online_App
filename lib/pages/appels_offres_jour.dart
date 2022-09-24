import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/partials/filter_page.dart';

class AppelsOffresJour extends StatefulWidget {
  const AppelsOffresJour({super.key});

  @override
  State<AppelsOffresJour> createState() => _AppelsOffresJourState();
}

class _AppelsOffresJourState extends State<AppelsOffresJour> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Appels d'offres du jour",
                        style: Theme.of(context).textTheme.headline6),
                    OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).primaryColor,
                         side:  BorderSide(
                          
                          color: Theme.of(context).primaryColor
                         )
                            ),
                        onPressed:() async{
                          var filter=await Get.to(()=>const FilterPage());

                          print(filter);
                        },
                        icon: const FaIcon(FontAwesomeIcons.filter,size: 17),
                        label: const Text('Filtrer'))
                  ],
                ),
              )
            ],
          ),
    );
  }
}




