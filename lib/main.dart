import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'pages/home/index.dart';

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
      home:  const Home(),
    );
  }
}
