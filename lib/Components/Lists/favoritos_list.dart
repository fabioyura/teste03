import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'card_list.dart';
import '../../Provider Repositories/favoritos_controller.dart';

class ListFavoritos extends StatefulWidget {
  const ListFavoritos({Key? key}) : super(key: key);

  @override
  _ListFavoritosState createState() => _ListFavoritosState();
}

class _ListFavoritosState extends State<ListFavoritos> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodeFavoritos favoritos = Provider.of(context);
    return favoritos.getListfavoritos.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Carregando...'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sem favoritos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ],
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: favoritos.getListfavoritos.length,
            itemBuilder: (ctx, i) {
              return CardLists(
                corCard: favoritos.getListfavoritos[i].type! == 'Filme'
                    ? const Color.fromARGB(255, 150, 0, 0)
                    : const Color.fromARGB(255, 0, 150, 0),
                name:
                    utf8.decode(favoritos.getListfavoritos[i].name!.codeUnits),
                type: favoritos.getListfavoritos[i].type!,
                fav: true,
              );
            });
  }
}
