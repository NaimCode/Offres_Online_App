import 'package:flutter/services.dart';

Future<String> getJson({required String file}) {
  return rootBundle.loadString(file);
}