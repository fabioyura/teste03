import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Widgets/home_widget.dart';
import 'Provider Repositories/page_controller.dart';
import 'Provider Repositories/screen_controller.dart';
import 'Provider Repositories/favoritos_controller.dart';
import 'Provider Repositories/personagens_controller.dart';
import 'Provider Repositories/filmes_controller.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GerenciamentodePaginas()),
        ChangeNotifierProvider(create: (ctx) => GerenciamentodeTelas()),
        ChangeNotifierProvider(create: (ctx) => GerenciamentodePersonagens()),
        ChangeNotifierProvider(create: (ctx) => GerenciamentodeFilmes()),
        ChangeNotifierProvider(create: (ctx) => GerenciamentodeFavoritos()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 255, 255),
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
