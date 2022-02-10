import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../HTTP/personagens_http.dart';
import 'card_list.dart';
import '../../Models/personagens.dart';
import '../../Provider Repositories/personagens_controller.dart';
import 'package:teste03/Models/personagens.dart';
import 'package:teste03/Provider%20Repositories/personagens_controller.dart';

import '../../Provider Repositories/favoritos_controller.dart';

class ListPersonagens extends StatefulWidget {
  const ListPersonagens({Key? key}) : super(key: key);

  @override
  _ListPersonagensState createState() => _ListPersonagensState();
}

class _ListPersonagensState extends State<ListPersonagens> {
  ScrollController controller = ScrollController();
  late Future<PersonagensPage> futurePersonagem;

  int pageloc = 2;
  bool buscandomais = false;
  bool pararbusca = false;
  int maxinfo = 0;

  @override
  void initState() {
    super.initState();
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
    maxinfo = perso.getmaxinfoperso;
    pageloc = perso.getPersoPage;
    if (perso.getListpersonagens.length >= maxinfo) {
      setState(() {
        pararbusca = true;
      });
    }
    controller.addListener(() {
      if (pararbusca == false) {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          if (buscandomais == false) {
            pegarmaispersonagens();
          }
        }
      }
    });
  }

  pegarmaispersonagens() {
    setState(() {
      buscandomais = true;
    });
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
    futurePersonagem = fetchPersonagens(pageloc.toString());

    int proxPagina = pageloc++;
    futurePersonagem.then((value) => {
          perso.setListpersonagens(
            perso.getListpersonagens..addAll(value.results),
          ),
          perso.setPersoPage(proxPagina),
          setState(() {
            buscandomais = false;
          }),
          if (perso.getListpersonagens.length >= maxinfo)
            {
              setState(() {
                pararbusca = true;
              }),
            },
        });
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodePersonagens perso = Provider.of(context);
    final GerenciamentodeFavoritos favoritos = Provider.of(context);
    return perso.getListpersonagens.length <= 1
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
                  itemCount: perso.getListpersonagens.length,
                  itemBuilder: (ctx, i) {
                    return CardLists(
                      corCard: const Color.fromARGB(255, 54, 54, 54),
                      name: utf8
                          .decode(perso.getListpersonagens[i].name.codeUnits),
                      type: 'Personagem',
                      fav: favoritos.getListfavoritos.any((element) =>
                          perso.getListpersonagens[i].name == element.name),
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
                          Text('Loading...'),
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
