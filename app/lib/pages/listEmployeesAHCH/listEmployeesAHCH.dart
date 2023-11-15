import 'package:app/api/data.dart';
import 'package:app/class/employeeAHCH.dart';
import 'package:app/components/blockEmployeeAHCH/blockEmployeeAHCH.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListEmployeesAHCHPage extends StatefulWidget {
  const ListEmployeesAHCHPage({super.key});

  @override
  State<ListEmployeesAHCHPage> createState() => _ListEmployeesAHCHPageState();
}

class _ListEmployeesAHCHPageState extends State<ListEmployeesAHCHPage> {
  List<EmployeeAHCH> employeesahch = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/employeesahch'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      if (this.mounted) {
        setState(() {
          employeesahch = data.map((item) => EmployeeAHCH.fromJson(item)).toList();
        });
      }
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: employeesahch.length,
              itemBuilder: (context, index) {
                return BlockEmployeeAHCH(employeeAHCH: employeesahch[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
