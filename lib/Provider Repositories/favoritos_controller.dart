import 'package:flutter/material.dart';
import '../Models/favoritos.dart';
import 'package:teste03/Database/favoritos_database.dart';

class GerenciamentodeFavoritos with ChangeNotifier {
  //Pagina Favoritos
  List<Favoritos> listaFavoritos = [];

  final favoritosDatabase = DatabaseFavoritos.instance;

  List<Favoritos> get getListfavoritos {
    return listaFavoritos;
  }

  void setaddListfavoritos(Favoritos value) {
    listaFavoritos.add(value);
    inserir(value);
    notifyListeners();
  }

  void setremoveListfavoritos(Favoritos value) {
    deletar(value);
    notifyListeners();
  }

  //Database

  void inserir(Favoritos dados) async {
    Map<String, dynamic> row = {
      DatabaseFavoritos.columnName: dados.name,
      DatabaseFavoritos.columnType: dados.type
    };
    await favoritosDatabase.inserirFavorito(row);
  }

  void deletar(Favoritos dados) async {
    await favoritosDatabase.deletarFavorito(dados.name!);
  }

  obterFavoritos() async {
    final gt = await favoritosDatabase.getFavoritos();
    listaFavoritos.clear();

    for (var element in gt) {
      listaFavoritos.add(
        Favoritos(
          id: element[DatabaseFavoritos.columnId],
          name: element[DatabaseFavoritos.columnName],
          type: element[DatabaseFavoritos.columnType],
        ),
      );
    }
  }
}
