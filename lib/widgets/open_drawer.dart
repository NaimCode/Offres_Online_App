import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OpenDrawerButton extends StatelessWidget {
  const OpenDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Menu',
        splashRadius: 22,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const FaIcon(FontAwesomeIcons.bars));
  }
}
