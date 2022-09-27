import 'package:intl/intl.dart';

String dateFormatDMY({required DateTime date}) {
  int y = date.year;
  int m = date.month;
  int d = date.day;

  return '$d/$m/$y';
}


String dateHumanFormat({required DateTime date}){
  return DateFormat.yMMMMd('fr_FR').format(date);
}