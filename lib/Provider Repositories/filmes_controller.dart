import 'package:flutter/material.dart';
import '../Models/filmes.dart';

class GerenciamentodeFilmes with ChangeNotifier {
  List<Filme> filmes = [];
  int filmepage = 1;
  int maxinfofilmes = 0;

  List<Filme> get getListfilmes {
    return filmes;
  }

  void setListfilmes(List<Filme> value) {
    filmes = value;
    notifyListeners();
  }

  int get getFilmePage {
    return filmepage;
  }

  void setFilmePage(int value) {
    filmepage = value;
    notifyListeners();
  }

  int get getmaxinfofilmes {
    return maxinfofilmes;
  }

  void setmaxinfofilmes(int value) {
    maxinfofilmes = value;
    notifyListeners();
  }
}
