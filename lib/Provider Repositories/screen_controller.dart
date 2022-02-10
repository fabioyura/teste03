import 'package:flutter/material.dart';
import 'package:teste03/Widgets/body_widget.dart';

class GerenciamentodeTelas with ChangeNotifier {
  bool siteoficialaberto = false;

  bool editaravataraberto = false;

  Widget tela = const Expanded(
    child: BodyApp(),
  );

  Widget get gettela {
    return tela;
  }

  void settela(Widget value) {
    tela = value;
    notifyListeners();
  }

  bool get getsiteoficial {
    return siteoficialaberto;
  }

  void setsiteoficial(bool value) {
    siteoficialaberto = value;
    notifyListeners();
  }

  bool get getavatar {
    return editaravataraberto;
  }

  void setavatar(bool value) {
    editaravataraberto = value;
    notifyListeners();
  }
}
