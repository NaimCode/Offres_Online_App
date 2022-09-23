import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/widgets/inDevelopment.dart';
import 'config/theme.dart';
import 'partials/layout.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: THEME,
      initialRoute: "/",
      routingCallback: (routing) {
        if (routing?.current == '/second') {}
      },
      getPages: [
        GetPage(name: "/", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/avis_rectification", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/favoris", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/appels_offres_jour", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/appels_offres_prives", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/dce_enligne", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/archives_appels_offres", page: () => const Layout(content: InDevelopment())),
        GetPage(name: "/appels_offres_afrique", page: () => const Layout(content: InDevelopment())),
      ],
    );
  }
}
