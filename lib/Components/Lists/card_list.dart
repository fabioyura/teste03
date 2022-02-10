import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste03/Models/favoritos.dart';
import '../../Provider Repositories/favoritos_controller.dart';

class CardLists extends StatefulWidget {
  final Color corCard;
  final String name;
  final String type;
  final bool? fav;
  const CardLists({
    Key? key,
    required this.corCard,
    required this.name,
    required this.type,
    this.fav,
  }) : super(key: key);

  @override
  _CardListsState createState() => _CardListsState();
}

class _CardListsState extends State<CardLists> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodeFavoritos favoritos = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: widget.corCard,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      height: 170,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(left: 8, top: 8, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.type),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 2,
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  if (widget.fav == true) {
                    favoritos.setremoveListfavoritos(
                        Favoritos(name: widget.name, type: widget.type));
                  } else {
                    favoritos.setaddListfavoritos(
                        Favoritos(name: widget.name, type: widget.type));
                    setState(() {});
                  }
                },
                child: Center(
                  child: widget.fav == true
                      ? const Icon(
                          Icons.favorite,
                          size: 40,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border_rounded,
                          size: 40,
                          color: Colors.white,
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
