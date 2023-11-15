import 'package:app/api/data.dart';
import 'package:app/class/group.dart';
import 'package:app/class/schedule.dart';
import 'package:app/components/blockSchedule/blockSchedule.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListSchedulePage extends StatefulWidget {
  const ListSchedulePage({super.key});

  @override
  State<ListSchedulePage> createState() => _ListSchedulePageState();
}

class _ListSchedulePageState extends State<ListSchedulePage> {
  late Future<List<Lesson>> futureLessons;
  LessonForDay lessonForDay =
      LessonForDay(group: Group(id: 1, groupName: "160"));

  @override
  void initState() {
    super.initState();
    futureLessons = fetchData(1);
  }

  Future<List<Lesson>> fetchData(int group) async {
    final response = await http.get(
      Uri.parse('$URL/getcurrent/$group'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return data.map((item) => Lesson.fromJson(item)).toList();
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
            child: FutureBuilder(
              future: futureLessons,
              builder: (context, AsyncSnapshot<List<Lesson>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No data available.'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return BlockSchedule(
                        lesson: snapshot.data![index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
