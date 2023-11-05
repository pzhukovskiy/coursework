import 'package:app/class/teacher.dart';
import 'package:app/components/blockTeacher/blockTeacher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListTeachersPage extends StatefulWidget {
  const ListTeachersPage({super.key});

  @override
  State<ListTeachersPage> createState() => _ListTeachersPageState();
  
}

class _ListTeachersPageState extends State<ListTeachersPage> {
  List<Teacher> teachers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://api.dionisiubrovka.online/api/v1/teachers/'),
      headers: {
        'Authorization': 'Token 79dbae9a4a3b2e4553f961f9d2ad676cd69977ee',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        teachers = data.map((item) => Teacher.fromJson(item)).toList();
      });
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Педагогический состав'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  return BlockTeacher(teacher: teachers[index]);
                },
              ),
            ),
          ],
        ));
  }
}