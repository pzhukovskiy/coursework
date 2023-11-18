import 'package:app/api/data.dart';
import 'package:app/class/schedule.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Group {
  int id;
  String groupName;
  static List<Group> groups = [];

  Group({
    required this.id,
    required this.groupName,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      groupName: json['group'],
    );
  }

  static Future<List<Group>> getFetchAll() async {
    var url = Uri.parse("$URL/groups/");
    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Token $TOKEN"
    });

    final List body = json.decode(utf8.decode(response.bodyBytes));
    return body.map((e) => Group.fromJson(e)).toList();
  }

  Future<List<Lesson>> getTodayTimetable() async {
    var url = Uri.parse("$URL/getcurrent/$id/");
    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Token $TOKEN"
    });

    final List body = json.decode(utf8.decode(response.bodyBytes));
    return body.map((e) => Lesson.fromJson(e)).toList();
  }

  Future<List<Lesson>> getWeekTimetable() async {
    var url = Uri.parse("$URL/getforweek/");
    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Token $TOKEN"
    });

    final List body = json.decode(utf8.decode(response.bodyBytes));
    return body.map((e) => Lesson.fromJson(e)).toList();
  }
}
