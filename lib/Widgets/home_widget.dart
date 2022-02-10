import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste03/Components/avatar.dart';
import 'package:teste03/Widgets/pagina_oficial.dart';
import '../Components/avatar.dart';
import '../Components/custom_button.dart';
import '../Models/filmes.dart';
import '../Models/personagens.dart';
import '../Provider Repositories/screen_controller.dart';
import '../Provider Repositories/personagens_controller.dart';
import '../Provider Repositories/filmes_controller.dart';
import '../HTTP/filmes_http.dart';
import '../HTTP/personagens_http.dart';
import '../Widgets/body_widget.dart';

import '../Provider Repositories/favoritos_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<PersonagensPage> futurePersonagem;
  late Future<FilmesPage> futureFilmes;

  @override
  void initState() {
    super.initState();
    futureFilmes = fetchFilmes('');
    futurePersonagem = fetchPersonagens('');
    final GerenciamentodePersonagens perso =
        Provider.of(context, listen: false);
    final GerenciamentodeFilmes fil = Provider.of(context, listen: false);
    futurePersonagem.then((value) => {
          perso.setListpersonagens(value.results),
          perso.setPersoPage(2),
          perso.setmaxinfoperso(value.count),
        });
    futureFilmes.then((value) => {
          fil.setListfilmes(value.results),
          fil.setFilmePage(2),
          fil.setmaxinfofilmes(value.count),
        });
    final GerenciamentodeFavoritos favoritos =
        Provider.of(context, listen: false);
    favoritos.favoritosDatabase; //OBS
  }

  @override
  Widget build(BuildContext context) {
    final GerenciamentodeTelas telas = Provider.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BtnSite(
                    title: 'Site Oficial',
                    link: 'https://www.starwars.com/community',
                    height: 40,
                    width: 150,
                    funcao: () {
                      if (telas.getsiteoficial == false) {
                        telas.getavatar == true ? telas.setavatar(false) : null;
                        telas.settela(
                          const Expanded(
                            child: SiteOficial(),
                          ),
                        );
                        telas.setsiteoficial(true);
                      } else {
                        telas.settela(
                          const Expanded(
                            child: BodyApp(),
                          ),
                        );
                        telas.setsiteoficial(false);
                      }
                    },
                  ),
                  const Avatar(),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            telas.gettela
          ],
        ),
      ),
    );
  }
}
