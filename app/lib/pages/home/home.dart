import 'package:app/components/block/firstPage.dart';
import 'package:app/components/collegeNews/collegeNews.dart';
import 'package:app/components/links/links.dart';
import 'package:app/pages/listNews/listNews.dart';
import 'package:flutter/material.dart';

// * Первая страница в bottom menu
class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 210,
              child: FirstPage(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 40,
              color: Colors.green,
              child: const CollegeNews(),
            ),
            // * Сделать отдельный виджет с 3 новостями
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              height: 150,
              child: const ListNewsPage(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              height: 250,
              child: const Links(),
            ),
          ],
        ),
      ),
    );
  }
}
