import 'package:app/class/testData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestDataOut extends StatelessWidget {
  final Item items;

  const TestDataOut({Key? key, required this.items}) : super(key: key);

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.infoAboutTeacher),
          content: Column(
            children: [
              Image.network(items.image, height: 100, width: 100),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(items.description),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.close),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.share),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundColor =
        brightness == Brightness.dark ? Colors.grey[800] : Colors.blue[400];
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.white;

    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: InkWell(
          onTap: () {
            _showPopup(context);
          },
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
                  child: Image.network(items.image, height: 100, width: 100),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${items.title}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: textColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
