class Game {
  final String title;
  final String description;
  final String year;

  const Game({
    required this.title,
    required this.description,
    required this.year,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'] as String,
      description: json['description'] as String,
      year: json['year'] as String,
    );
  }
}