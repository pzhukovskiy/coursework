import 'package:flutter/material.dart';

class AboutCollege extends StatelessWidget {
  const AboutCollege({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              margin: const EdgeInsets.all(15.0),
              color: Colors.blue,
              child: const Stack(
                children: <Widget>[
                  Positioned(
                    top: 20.0,
                    left: 50.0,
                    child: Text(
                      'МГКЦТ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
