class Favoritos {
  int? id;
  String? name;
  String? type;

  Favoritos({
    this.id,
    required this.name,
    required this.type,
  });

  Favoritos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }
}
