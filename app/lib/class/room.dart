import 'package:app/class/corpus.dart';

class Room {
  int id;
  Corpus corpus;
  String roomName;

  Room({
    required this.id,
    required this.corpus,
    required this.roomName,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      corpus: Corpus.fromJson(json['corpus']),
      roomName: json['room'],
    );
  }
}