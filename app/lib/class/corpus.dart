class Corpus {
  int id;
  String corpusName;

  Corpus({
    required this.id,
    required this.corpusName,
  });

  factory Corpus.fromJson(Map<String, dynamic> json) {
    return Corpus(
      id: json['id'],
      corpusName: json['corpus'],
    );
  }
}