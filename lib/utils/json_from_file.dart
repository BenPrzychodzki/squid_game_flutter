import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<dynamic>> readJson(String fileName) async {
  final String response = await rootBundle.loadString('assets/$fileName.json');
  return await json.decode(response);
}