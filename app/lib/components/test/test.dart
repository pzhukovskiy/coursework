import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  final List<Map<String, dynamic>> items = List.generate(
    21,
    (index) => {
      "index": index,
      "text": "Элемент $index",
      "description": "Описание элемента $index",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Список с всплывающим окном'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]["text"]),
              subtitle: Text(items[index]["description"]),
              onTap: () {
                _showPopup(context, items[index]);
              },
            );
          },
        ));
  }
}

void _showPopup(BuildContext context, Map<String, dynamic> item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Индекс: ${item['index']}"),
        content: Column(
          children: [
            Text("Текст: ${item['text']}"),
            Text("Описание: ${item['description']}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Закрыть"),
          ),
        ],
      );
    },
  );
}
