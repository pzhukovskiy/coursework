import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// * На главной странице маленький виджет
class CollegeNews extends StatelessWidget {
  const CollegeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 40,
        padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 0),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(AppLocalizations.of(context)!.collegeNews,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  child: Text(AppLocalizations.of(context)!.seeAll,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
