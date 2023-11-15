import 'package:app/api/data.dart';
import 'package:app/class/schedule.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Group {
  int id;
  String groupName;
  static List<Group> groups = [];

  static Future<void> fetchGroups() async {
    final response = await http.get(
      Uri.parse('$URL/groups/'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      await data.map((item) => groups.add(Group.fromJson(item)));
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

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
}
