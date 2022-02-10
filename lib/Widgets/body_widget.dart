import 'package:flutter/material.dart';
import '../Widgets/lists_area.dart';
import '../Widgets/topics_navigation.dart';

class BodyApp extends StatefulWidget {
  const BodyApp({Key? key}) : super(key: key);

  @override
  _BodyAppState createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopicsNavigation(),
        Expanded(
          child: ListsArea(),
        ),
      ],
    );
  }
}
