import 'package:app/class/testData.dart';
import 'package:app/components/testDataOut/testDataOut.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// * Полноценный виджет, полное окно
class CollegeNewsPage extends StatefulWidget {
  const CollegeNewsPage({super.key});

  @override
  State<CollegeNewsPage> createState() => _CollegeNewsPageState();
}

class _CollegeNewsPageState extends State<CollegeNewsPage> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    fetchDataTest();
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
      appBar: AppBar(
        title: Text('text'),
      ),
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