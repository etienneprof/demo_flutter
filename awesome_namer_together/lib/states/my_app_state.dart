import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// MyAppState désigne "l'état de mon application" :
///   elle porte les données manipulées et affichées par mon appli
/// Il s'agit d'un "app state" : il n'est lié à aucun Widget
class MyAppState extends ChangeNotifier {
  var wordpair = WordPair.random();
  var favorites = <WordPair>[];

  void next() {
    wordpair = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite(WordPair selected) {
    if (favorites.contains(selected)) {
      favorites.remove(selected);
    } else {
      favorites.add(selected);
    }
    notifyListeners();
  }
}
