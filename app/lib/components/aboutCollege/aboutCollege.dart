import 'package:flutter/material.dart';

class AboutCollege extends StatelessWidget {
  const AboutCollege({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350.0,
                height: 600.0,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "1966 - во исполнение постановления ЦК КПБ и Совета Министров БССР №127 от 24.03.1966 года на базе завода имени Дзержинского создано 'Техническое училище №76-электротехники'",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "- директором училища назначен Александр Михайлович Гармоза – инициатор и организатор подготовки учащихся по новым специальностям, который заложил традиции и создал условия для активного участия педагогического коллектива и коллектива учащихся в Выставке достижений народного хозяйства СССР в Москве.",
                        style: TextStyle(color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1967 -  стали ежегодно проводиться месячники памяти бойцов специальной диверсионной группы НКВД под командованием майора Козанцева, действовавшей в годы Великой Отечественной войны на территории Логойского района. В числе руководителей спецгруппы был Фалей С.М., впоследствии – помощник директора училища. Коллектив училища восстановил землянку партизанского отряда близ деревни Янушковичи Логойского района, которая на долгие годы стала объектом заботы и шефства учащихся и педагогов училища и местом проведения туристических слетов.",
                        style: TextStyle(color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1969 - за высокопрофессиональную подготовку рабочих кадров училище получило статус цеха №1 НПО «Интеграл». Это был первый шаг признания в СССР значимости подготовки рабочих кадров для передовых отраслей народного хозяйства;",
                        style: TextStyle(color: textColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
