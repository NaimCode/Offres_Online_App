import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/config/theme.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(height: 90,
      color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:5,horizontal: 40),
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50),
            
                textStyle: const TextStyle(
                  fontSize: 18
                )
              ),
              onPressed: (){
                Get.back(result: {'filter':100,'prix':4000});
              }, child: const Text('Rechercher')),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: PRIMARY_COLOR,
        title: const Text('Filtrer'),
        centerTitle: false,
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor
            ),
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.eraser, size: 20),
              label: const Text('Effacer',style: TextStyle(fontSize: 17),))
        ],
      ),
    );
  }
}
