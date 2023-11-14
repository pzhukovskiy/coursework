import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Links extends StatelessWidget {
  const Links({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.links,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildLink("mgke@minskedu.gov.by", Icons.email),
            buildLink("+375 17 374 11 62", Icons.phone),
            buildLink("https://t.me/mgkelektron", Icons.telegram),
            buildLink("https://vk.com/public179671335", Icons.link),
          ],
        ),
      ),
    );
  }

  Widget buildLink(String text, IconData iconData) {
    return InkWell(
      onTap: () {

      },
      child: Row(
        children: [
          Icon(iconData, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
