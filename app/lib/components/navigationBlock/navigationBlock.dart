import 'package:flutter/material.dart';

class NavigationBlock extends StatelessWidget {
  const NavigationBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor =
        brightness == Brightness.dark ? Colors.grey[800] : Colors.blue[400];
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.white;

    return Container(
      height: 100,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            child: const Text('Педагогический состав'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
            ),
            onPressed: () {
              // Navigator.pushNamed(context, '/test');
            },
            child: const Text('Расписание'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
            ),
            onPressed: () {},
            child: const Text('Новости'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
            ),
            onPressed: () {},
            child: const Text('Абитуриентам'),
          ),
        ],
      ),
    );
  }
}
