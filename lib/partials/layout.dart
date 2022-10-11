import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:offres_onlines/partials/main_drawer.dart';
import 'package:offres_onlines/widgets/brand.dart';
import 'package:offres_onlines/widgets/open_drawer.dart';


class Layout extends StatefulWidget {
  final Widget content;
  const Layout({super.key,required this.content});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
         title: const Brand(),
         centerTitle: true,
          leading: const OpenDrawerButton(),
          actions:  [
            IconButton(
              tooltip: 'Profil',
             splashRadius: 22,
              onPressed: ()=>Get.toNamed("/settings"), icon: const FaIcon(FontAwesomeIcons.solidUser))
          ],
        ),
        drawer: const MainDrawer(),
        body: widget.content,
      //  bottomNavigationBar:  Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 20,
      //         color: Colors.black.withOpacity(.1),
      //       )
      //     ],
      //   ),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      //       child: GNav(
      //         rippleColor: Colors.grey[300]!,
      //         hoverColor: Colors.grey[100]!,
      //         gap: 8,
      //         activeColor: Colors.black,
      //         iconSize: 24,
      //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      //         duration: const Duration(milliseconds: 400),
      //         tabBackgroundColor: Colors.grey[100]!,
      //         color: Colors.black,
      //         tabs: const [
      //           GButton(
      //             icon: Icons.home,
      //             text: 'Home',
      //           ),
      //           GButton(
      //             icon: Icons.favorite,
      //             text: 'Likes',
      //           ),
      //           GButton(
      //             icon: Icons.search,
      //             text: 'Search',
      //           ),
      //           GButton(
      //             icon: Icons.person,
      //             text: 'Profile',
      //           ),
      //         ],
      //         // selectedIndex: _selectedIndex,
      //         // onTabChange: (index) {
      //         //   setState(() {
      //         //     _selectedIndex = index;
      //         //   });
      //         // },
      //       ),
      //     ),
      //   ),
      // ),
      );
  }
}