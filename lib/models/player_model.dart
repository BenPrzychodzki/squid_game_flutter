class Player {
  final String id;
  final String name;
  final String? pict;
  final String description;
  bool isEliminated = false;

  Player(this.id, this.name, this.pict, this.description);

  Player.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        pict = json['pict'],
        description = json['description'];
}