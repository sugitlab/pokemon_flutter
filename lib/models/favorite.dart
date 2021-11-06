import 'package:flutter/material.dart';

class FavoritesNotifier extends ChangeNotifier {
  final List<Favorite> _favs = [];

  List<Favorite> get favs => _favs;

  void toggle(Favorite fav) {
    if (isExist(fav.pokeId)) {
      delete(fav.pokeId);
    } else {
      add(fav);
    }
  }

  bool isExist(int id) {
    if (_favs.indexWhere((fav) => fav.pokeId == id) < 0) {
      return false;
    }
    return true;
  }

  void add(Favorite fav) {
    favs.add(fav);
    notifyListeners();
  }

  void delete(int id) {
    favs.removeWhere((fav) => fav.pokeId == id);
    notifyListeners();
    // エラー処理あった方が良い
  }
}

class Favorite {
  final int pokeId;

  Favorite({
    required this.pokeId,
  });
}
