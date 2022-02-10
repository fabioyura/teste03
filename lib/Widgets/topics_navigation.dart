import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider Repositories/page_controller.dart';
import '../Components/Lists/filmes_list.dart';
import '../Components/Lists/favoritos_list.dart';
import '../Components/Lists/personagens_list.dart';

class TopicsNavigation extends StatefulWidget {
  const TopicsNavigation({Key? key}) : super(key: key);

  @override
  _TopicsNavigationState createState() => _TopicsNavigationState();
}

class _TopicsNavigationState extends State<TopicsNavigation> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodePaginas pages = Provider.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 35,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                pages.setpage(const ListFilmes());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Filmes',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                pages.setpage(const ListPersonagens());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Personagens',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                pages.setpage(const ListFavoritos());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Favoritos',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 213, 213),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
