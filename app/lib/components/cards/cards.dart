import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final BuildContext myContext;

  Cards({required this.myContext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 115, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: _buildCard(
                    myContext,
                    'Педагогический коллектив',
                    'assets/images/college.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: _buildCard(
                    myContext,
                    'Ветераны',
                    'assets/images/college.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: _buildCard(
                    myContext,
                    'Служащие',
                    'assets/images/college.png',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: _buildCard(
                    myContext,
                    'Служащие АХЧ',
                    'assets/images/college.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: _buildCard(
                    myContext,
                    'Почётные работники колледжа',
                    'assets/images/college.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String imagePath) {
    return Container(
      height: 145,
      width: MediaQuery.of(context).size.width / 3 - 2.5,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 75,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
