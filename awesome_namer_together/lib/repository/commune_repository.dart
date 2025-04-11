import 'dart:convert';

import 'package:awesome_namer_together/bo/commune.dart';
import 'package:http/http.dart' as http;

Future<List<Commune>> fetch_commune() async {
  final response = await http.get(Uri.parse('https://geo.api.gouv.fr/communes?limit=100'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List<dynamic>)
              .map((element) => element as Map<String, dynamic>)
              .map<Commune>(Commune.fromJson)
              .toList();
  }

  /*if (response.statusCode == 200) {
    var communes = (jsonDecode(response.body) as List<dynamic>)
                        .map((element) => element as Map<String, dynamic>);
   
    var result = List<Commune>.empty(growable: true);
    for (var commune in communes) {
      result.add(Commune.fromJson(commune));
    }
    return result;
  }
  */

  throw Exception('Impossible de charger les communes');
}