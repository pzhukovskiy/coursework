class Item {
  final int id;
  final String title;
  final String description;
  final String image;

  const Item({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }
}