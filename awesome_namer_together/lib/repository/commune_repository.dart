import 'dart:convert';

import 'package:awesome_namer_together/bo/commune.dart';
import 'package:http/http.dart' as http;

Future<List<Commune>> fetch_commune() async {
  final response = await http.get(Uri.parse('https://geo.api.gouv.fr/communes'));

  if (response.statusCode == 200) {
    var communes = jsonDecode(response.body) as List<Map<String, dynamic>>;
    // return communes.map<Commune>(Commune.fromJson).toList();
    var result = List<Commune>.empty();
    for (var commune in communes) {
      result.add(Commune.fromJson(commune));
    }
    return result;
  }

  throw Exception('Impossible de charger les communes');
}