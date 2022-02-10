import 'package:flutter/material.dart';
import 'package:teste03/Components/Lists/filmes_list.dart';

class GerenciamentodePaginas with ChangeNotifier {
  Widget page = const ListFilmes();

  Widget get getpage {
    return page;
  }

  void setpage(Widget value) {
    page = value;
    notifyListeners();
  }
}
