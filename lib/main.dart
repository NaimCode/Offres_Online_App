import 'package:flutter/material.dart';
import 'package:offre/config/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: THEME,
      home:  Scaffold(
        appBar: AppBar(),
        body: Center(child: ElevatedButton(onPressed: (){}, child: const Text('Click'))),
      ),
    );
  }
}
