import 'package:app/class/teacher.dart';
import 'package:app/class/testData.dart';
// import 'package:app/components/blockTeacher/blockTeacher.dart';
import 'package:app/components/testDataOut/testDataOut.dart';
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
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    fetchDataTest();
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
      if (this.mounted) {
        setState(() {
          teachers = data.map((item) => Teacher.fromJson(item)).toList();
        });
      }
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

  Future<void> fetchDataTest() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      if (this.mounted) {
        setState(() {
          items = data.map((item) => Item.fromJson(item)).toList();
        });
      }
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              // return BlockTeacher(teacher: teachers[index]);
              return TestDataOut(items: items[index]);
            },
          ),
        ),
      ],
    ));
  }
}