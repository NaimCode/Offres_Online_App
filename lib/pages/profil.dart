import 'package:flutter/material.dart';
import 'package:offres_onlines/config/theme.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        elevation: 0,
       
      ),
    
    );
  }
}