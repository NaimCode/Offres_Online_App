
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';



MaterialColor PRIMARY_COLOR=const MaterialColor(0xff0B2C40, {
      50: Color(0xffce5641 ),//10% 
      100: Color(0xffb74c3a),//20% 
      200: Color(0xffa04332),//30% 
      300: Color(0xff89392b),//40% 
      400: Color(0xff595959),//50% 
      500: Color(0xff4D4D4D),//60% 
      600: Color(0xff404040),//70% 
      700: Color(0xff262626),//80% 
      800: Color(0xff0D0D0D),//90% 
      900: Color(0xff000000),//100% 
  });

Color ACCENT_COLOR=const Color(0xffD0D0D3);
ThemeData THEME=ThemeData(
  //App background color
  primarySwatch: PRIMARY_COLOR,
  
  primaryColor: const Color(0xff0099DD),
 
  
  listTileTheme: ListTileThemeData(
    selectedTileColor: PRIMARY_COLOR.withOpacity(.1),
   
  )
  
);