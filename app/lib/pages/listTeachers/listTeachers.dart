import 'package:app/class/teacher.dart';
import 'package:app/components/blockLesson/blockLesson.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// class ListTeachersPage extends StatelessWidget {
//   final List<Teacher> teachers;
//   const ListTeachersPage({required this.teachers, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Педагогический состав'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView.builder(
//                 itemCount: teachers.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return BlockLesson(teacher: teachers[index]);
//                 },
//               ),
//             ),
//         ],
//       )
//     );
//   }
// }

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
      Uri.parse('http://127.0.0.1:8000/api/v1/teachers/'),
      headers: {
        'Authorization': 'Token 96f2d54d47603e6f965e4ab49779186483cf9629',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        teachers = data.map((item) => Teacher.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load data');
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
                itemBuilder: (BuildContext context, int index) {
                  return BlockLesson(teacher: teachers[index]);
                },
              ),
            ),
        ],
      )
    );
  }
}