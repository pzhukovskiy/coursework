// ignore: file_names
import 'package:flutter/material.dart';

class NotificationsBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const NotificationsBlock({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  final backgroundColor = brightness == Brightness.dark ? Colors.grey[800] : Colors.blue[400];
  final textColor = brightness == Brightness.dark ? Colors.white : Colors.white;
  final iconColor = brightness == Brightness.dark ? Colors.white : Colors.white;

    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Icon(icon, size: 14, color: iconColor),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 12, color: textColor),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0), child: Text('Text')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
