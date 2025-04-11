import 'package:awesome_namer_together/bo/commune.dart';
import 'package:awesome_namer_together/repository/commune_repository.dart';
import 'package:flutter/material.dart';

class CommunePage extends StatefulWidget {
  @override
  State<CommunePage> createState() => _CommunePageState();
}

class _CommunePageState extends State<CommunePage> {
  late Future<List<Commune>> result;

  @override
  Widget build(BuildContext context) {
    result = fetch_commune();

    return FutureBuilder(
      future: result,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
          children: [
              for (var commune in snapshot.data!)
                Card (
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('${commune.nom} (${commune.codePostal}) - ${commune.population} habitants'),
                  ),
                )
          ]);
        } else {
          return CircularProgressIndicator();
        }
      } 
    );
  }
}