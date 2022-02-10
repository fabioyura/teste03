import 'package:flutter/material.dart';
import '../Models/personagens.dart';

class GerenciamentodePersonagens with ChangeNotifier {
  int persopage = 1;
  int maxinfoperso = 0;

  List<Personagem> personagens = [];

  List<Personagem> get getListpersonagens {
    return personagens;
  }

  void setListpersonagens(List<Personagem> value) {
    personagens = value;
    notifyListeners();
  }

  int get getPersoPage {
    return persopage;
  }

  void setPersoPage(int value) {
    persopage = value;
    notifyListeners();
  }

  int get getmaxinfoperso {
    return maxinfoperso;
  }

  void setmaxinfoperso(int value) {
    maxinfoperso = value;
    notifyListeners();
  }
}
