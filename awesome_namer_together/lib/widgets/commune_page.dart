import 'package:awesome_namer_together/bo/commune.dart';
import 'package:awesome_namer_together/repository/commune_repository.dart';
import 'package:flutter/material.dart';

class CommunePage extends StatelessWidget {
  late Future<List<Commune>> result;
  
  @override
  Widget build(BuildContext context) {
    result = fetch_commune();

    return FutureBuilder(
      future: result,
      builder: (context, snapshot) {
        return ListView(
        children: [
          if (snapshot.hasData)
            for (var commune in snapshot.data!)
              Card (
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('${commune.nom} (${commune.codePostal}) - ${commune.population} habitants'),
                ),
              )
          else
            CircularProgressIndicator()
        ],
      );
      } 
    );
  }
  
}