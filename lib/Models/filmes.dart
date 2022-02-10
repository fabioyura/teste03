class Filme {
  String? title;
  int? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  String? releaseDate;
  List<String>? characters;
  List<String>? planets;
  List<String>? starships;
  List<String>? vehicles;
  List<String>? species;
  String? created;
  String? edited;
  String? url;

  Filme(
      {this.title,
      this.episodeId,
      this.openingCrawl,
      this.director,
      this.producer,
      this.releaseDate,
      this.characters,
      this.planets,
      this.starships,
      this.vehicles,
      this.species,
      this.created,
      this.edited,
      this.url});

  Filme.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    characters = json['characters'].cast<String>();
    planets = json['planets'].cast<String>();
    starships = json['starships'].cast<String>();
    vehicles = json['vehicles'].cast<String>();
    species = json['species'].cast<String>();
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }
}

/*        <------PÁGINA DE FILMES------>        */

class FilmesPage {
  final int count;
  final String? next;
  final String? previous;
  final List<Filme> results;

  const FilmesPage({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory FilmesPage.fromJson(Map<String, dynamic> json) {
    return FilmesPage(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          json['results'].map<Filme>((json) => Filme.fromJson(json)).toList(),
    );
  }
}
