import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste03/Models/filmes.dart';
import '../../Components/Lists/card_list.dart';
import '../../HTTP/filmes_http.dart';

import '../../Provider Repositories/favoritos_controller.dart';
import '../../Provider Repositories/filmes_controller.dart';

class ListFilmes extends StatefulWidget {
  const ListFilmes({Key? key}) : super(key: key);

  @override
  _ListFilmesState createState() => _ListFilmesState();
}

class _ListFilmesState extends State<ListFilmes> {
  ScrollController controller = ScrollController();
  late Future<FilmesPage> futureFilmes;
  int pageloc = 2;
  bool buscandomais = false;
  bool pararbusca = false;
  int maxinfo = 0;

  @override
  void initState() {
    super.initState();
    final GerenciamentodeFilmes filme = Provider.of(context, listen: false);
    maxinfo = filme.getmaxinfofilmes;
    pageloc = filme.getFilmePage;
    if (filme.getListfilmes.length >= maxinfo) {
      setState(() {
        pararbusca = true;
      });
    }
    controller.addListener(() {
      if (pararbusca == false) {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          if (buscandomais == false) {
            pegarmaisfilme();
          }
        }
      }
    });
  }

  pegarmaisfilme() {
    setState(() {
      buscandomais = true;
    });
    final GerenciamentodeFilmes filme = Provider.of(context, listen: false);
    futureFilmes = fetchFilmes(pageloc.toString());

    int proxPagina = pageloc++;
    futureFilmes.then((value) => {
          filme.setListfilmes(
            filme.getListfilmes..addAll(value.results),
          ),
          filme.setFilmePage(proxPagina),
          setState(() {
            buscandomais = false;
          }),
          if (filme.getListfilmes.length >= maxinfo)
            {
              setState(() {
                pararbusca = true;
              }),
            },
        });
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodeFilmes filmes = Provider.of(context);
    final GerenciamentodeFavoritos favoritos = Provider.of(context);
    return filmes.getListfilmes.length <= 1
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Carregando...'),
                SizedBox(height: 10),
                Text(
                  'Caregando...',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        : Stack(
            children: [
              ListView.builder(
                  controller: controller,
                  itemCount: filmes.getListfilmes.length,
                  itemBuilder: (ctx, i) {
                    return CardLists(
                      corCard: const Color.fromARGB(255, 54, 54, 54),
                      name:
                          utf8.decode(filmes.getListfilmes[i].title!.codeUnits),
                      type: 'Filme',
                      fav: favoritos.getListfavoritos.any((element) =>
                          filmes.getListfilmes[i].title! == element.name),
                    );
                  }),
              Visibility(
                visible: buscandomais,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(97, 0, 0, 0),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Carregando...'),
                          SizedBox(height: 10),
                          Text(
                            'Caregando mais Personagens...',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
