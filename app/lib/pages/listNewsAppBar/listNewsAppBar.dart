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
  late Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchData();
  }

  Future<List<News>> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/news'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return data.map((item) => News.fromJson(item)).toList();
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
            child: FutureBuilder(
              future: futureNews,
              builder: (context, AsyncSnapshot<List<News>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Данные недоступны'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return BlockNews(news: snapshot.data![index]);
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
