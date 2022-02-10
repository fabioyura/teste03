import 'package:flutter/material.dart';

class GerenciamentodeTelas with ChangeNotifier {
  bool siteoficialaberto = false;

  bool editaravataraberto = false;

  Widget tela = Expanded(
    child: ScreenWidget(),
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
