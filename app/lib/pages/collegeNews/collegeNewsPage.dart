import 'package:app/api/data.dart';
import 'package:app/class/news.dart';
import 'package:app/components/blockNews/blockNews.dart';
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
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/news'),
      headers: {
        'Authorization': 'Token 1095e6542f927c08b1eb5c7f036c59893527a2c5',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      if (this.mounted) {
        setState(() {
          news = data.map((item) => News.fromJson(item)).toList();
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
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return BlockNews(news: news[index]);
                },
              ),
            ),
          ],
        ));
  }
}
