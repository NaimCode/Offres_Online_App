String dateFormatDMY({required DateTime date}) {
  int y = date.year;
  int m = date.month;
  int d = date.day;

  return '$d/$m/$y';
}
