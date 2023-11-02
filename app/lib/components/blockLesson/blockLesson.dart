import 'package:app/class/teacher.dart';
import 'package:flutter/material.dart';

class BlockLesson extends StatelessWidget {
  final Teacher teacher;

  const BlockLesson({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor = brightness == Brightness.dark ? Colors.grey[800] : Colors.blue[400];
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.white;

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
                child: Image.network(teacher.image, height: 100, width: 100),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${teacher.middleName} ${teacher.firstName} ${teacher.lastName}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        teacher.lastName,
                        style: TextStyle(fontSize: 12, color: textColor),
                      ),
                    ),
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
