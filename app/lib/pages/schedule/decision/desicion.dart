import 'package:flutter/material.dart';

class DesicionPage extends StatefulWidget {
  const DesicionPage({Key? key}) : super(key: key);

  @override
  State<DesicionPage> createState() => _DesicionPageState();
}

class _DesicionPageState extends State<DesicionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButton(
              onPressed: () {
                Navigator.pushNamed(context, '/day');
              },
              text: 'Расписание на день',
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            _buildButton(
              onPressed: () {
                Navigator.pushNamed(context, '/week');
              },
              text: 'Расписание на неделю',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required String text,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
