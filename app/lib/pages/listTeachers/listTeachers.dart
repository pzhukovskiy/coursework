import 'package:app/api/data.dart';
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
  List<Teacher> filteredTeachers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/teachers'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      if (this.mounted) {
        setState(() {
          teachers = data.map((item) => Teacher.fromJson(item)).toList();
          filteredTeachers = List.from(teachers);
        });
      }
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

  // * Поиск преподавателя
  void _filterTeachers(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredTeachers = List.from(teachers);
      });
    } else {
      setState(() {
        filteredTeachers = teachers
            .where((teacher) =>
                teacher.firstName.toLowerCase().contains(query.toLowerCase()) ||
                teacher.lastName.toLowerCase().contains(query.toLowerCase()) ||
                teacher.middleName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: _filterTeachers,
          decoration: const InputDecoration(
            hintText: 'Искать преподавателей',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: filteredTeachers.length,
              itemBuilder: (context, index) {
                return BlockTeacher(teacher: filteredTeachers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
