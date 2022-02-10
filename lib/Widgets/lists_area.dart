import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider Repositories/page_controller.dart';

class ListsArea extends StatefulWidget {
  const ListsArea({Key? key}) : super(key: key);

  @override
  _ListsAreaState createState() => _ListsAreaState();
}

class _ListsAreaState extends State<ListsArea> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodePaginas pages = Provider.of(context);
    return Container(
        margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: pages.getpage);
  }
}
