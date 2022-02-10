import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 20),
          child: Center(
            child: FluttermojiCircleAvatar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              radius: MediaQuery.of(context).size.width / 4.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FluttermojiCustomizer(
            outerTitleText: 'Customize seu Avatar:',
            showSaveWidget: true,
          ),
        ),
      ],
    );
  }
}
