import 'package:app/api/data.dart';
import 'package:app/class/news.dart';
import 'package:app/components/blockNews/blockNews.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListNewsAppBarPage extends StatefulWidget {
  const ListNewsAppBarPage({super.key});

  @override
  State<ListNewsAppBarPage> createState() => _ListNewsAppBarPageState();
}

class _ListNewsAppBarPageState extends State<ListNewsAppBarPage> {
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
        'Authorization': 'Token $TOKEN',
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
      appBar: AppBar(),
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
