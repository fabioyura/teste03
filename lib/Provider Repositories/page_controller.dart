import 'package:flutter/material.dart';

class GerenciamentodePaginas with ChangeNotifier {
  Widget page = const FilmesWidget();

  Widget get getpage {
    return page;
  }

  void setpage(Widget value) {
    page = value;
    notifyListeners();
  }
}
