class News {
  int id;
  String dateCreate;
  String title;
  String image;
  String description;
  String mainText;
  String dateEdit;

  News({
    required this.id,
    required this.dateCreate,
    required this.title,
    required this.image,
    required this.description,
    required this.mainText,
    required this.dateEdit,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['id'],
        dateCreate: json['date_create'],
        title: json['title'],
        image: json['image'],
        description: json['description'],
        mainText: json['main_text'],
        dateEdit: json['date_edit']
    );
  }
}
