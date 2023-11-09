import 'package:app/components/block/myBlock.dart';
import 'package:app/components/collegeNews/collegeNews.dart';
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
            Container(
              height: 210, 
              child: MyBlock(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 60,
              child: CollegeNews(),
            ),
          ],
        ),
      ),
    );
  }
}
