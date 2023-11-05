import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
final List<Map<String, dynamic>> items = [
  {
    "index": 0,
    "text": "Элемент 0",
    "description": "Описание элемента 0",
  },
  {
    "index": 1,
    "text": "Элемент 1",
    "description": "Описание элемента 1",
  },
  {
    "index": 2,
    "text": "Элемент 2",
    "description": "Описание элемента 2",
  },
];


  @override
  Widget build(BuildContext context) {
    String selectedValue = items[0]["text"];

    void showSnackbar(String title, String description) {
      final snackBar = SnackBar(
        content: ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Список с всплывающим окном'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            int selectedIndex = items.indexWhere((item) => item["text"] == newValue);
            showSnackbar(items[selectedIndex]["text"], items[selectedIndex]["description"]);
          },
          items: items
              .map<DropdownMenuItem<String>>(
                (Map<String, dynamic> item) => DropdownMenuItem<String>(
                  value: item["text"],
                  child: Text(item["text"]),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
