import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/personagens.dart';

String baseURL = 'https://swapi.dev/api/people/?';
String formatReq = 'format=json';

Future<PersonagensPage> fetchPersonagens(String page) async {
  String pesqUrl = page == ''
      ? baseURL + formatReq
      : baseURL + 'page=' + page + '&' + formatReq;
  final response = await http.get(Uri.parse(pesqUrl));

  if (response.statusCode == 200) {
    return PersonagensPage.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
