import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offres_onlines/widgets/open_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const OpenDrawerButton(),
          actions:  [
            IconButton(
             splashRadius: 22,
              onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.solidUser))
          ],
        ),
        drawer: const Drawer(),
        body: Center(child: ElevatedButton(onPressed: (){}, child: const Text('Click'))),
      );
  }
}