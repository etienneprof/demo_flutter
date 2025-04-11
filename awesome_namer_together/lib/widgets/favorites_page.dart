import 'package:awesome_namer_together/main.dart';
import 'package:awesome_namer_together/states/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Vous avez ${favorites.length} favoris enregistrés :'),
        ),
        for (var pair in favorites)
          ListTile(
            onTap: () => {
              appState.toggleFavorite(pair)
            },
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
  
}