import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:provider/provider.dart';
import 'package:teste03/Widgets/body_widget.dart';
import '../Provider Repositories/screen_controller.dart';
import '../Widgets/avatar_widget.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final GerenciamentodeTelas telas = Provider.of(context);
    return GestureDetector(
      onTap: () {
        if (telas.getavatar == false) {
          telas.getsiteoficial == true ? telas.setsiteoficial(false) : null;
          telas.settela(
            const Expanded(
              child: AvatarWidget(),
            ),
          );
          telas.setavatar(true);
        } else {
          telas.settela(
            const Expanded(
              child: BodyApp(),
            ),
          );
          telas.setavatar(false);
        }
      },
      child: FluttermojiCircleAvatar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        radius: 40,
      ),
    );
  }
}
