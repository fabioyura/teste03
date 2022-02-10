import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/filmes.dart';

String baseURL = 'https://swapi.dev/api/films/?';
String formatReq = 'format=json';

Future<FilmesPage> fetchFilmes(String page) async {
  String pesqUrl = page == ''
      ? baseURL + formatReq
      : baseURL + 'page=' + page + '&' + formatReq;
  final response = await http.get(Uri.parse(pesqUrl));

  if (response.statusCode == 200) {
    return FilmesPage.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
