import 'package:flutter/material.dart';

class RegAuthPage extends StatefulWidget {
  const RegAuthPage({super.key});

  @override
  State<RegAuthPage> createState() => _RegAuthPageState();
}



class _RegAuthPageState extends State<RegAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/reg');
              },
              child: const Text('Регистрация'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/auth');
              },
              child: const Text('Авторизация'),
            ),
          ),
        ],
      ),
    );
  }
}
