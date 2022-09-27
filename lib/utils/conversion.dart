import 'package:intl/intl.dart';

String dateFormatDMY({required DateTime date}) {
  int y = date.year;
  int m = date.month;
  int d = date.day;

  return '$d/$m/$y';
}

bool isToday({required DateTime? date}){
return date==null ||DateFormat.yMd().format(date)==DateFormat.yMd().format(DateTime.now());
}
String dateHumanFormat({required DateTime? date,bool noToday=false}){
  bool today=isToday(date: date);
  String result=date==null?"": DateFormat.yMMMMd('fr_FR').format(date);
  return noToday?result:today?"Aujourd'hui":result ;
}