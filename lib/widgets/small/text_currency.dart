import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextCurrency extends StatelessWidget {
  final dynamic number;
  final TextStyle? style;
   TextCurrency({super.key,required this.number,this.style});
  final _ = NumberFormat("#,##0.00", "fr_FR");
  @override
  Widget build(BuildContext context) {
   
   double? v=number is String?double.tryParse(number):number;
    return Text(v==null||number==null?"---":_.format(v),style: style);
  }
}