import 'package:app/api/data.dart';
import 'package:app/class/employee.dart';
import 'package:app/components/blockEmployee/blockEmployee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListEmployeesPage extends StatefulWidget {
  const ListEmployeesPage({super.key});

  @override
  State<ListEmployeesPage> createState() => _ListEmployeesPageState();
}

class _ListEmployeesPageState extends State<ListEmployeesPage> {
  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/employees'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      if (this.mounted) {
        setState(() {
          employees = data.map((item) => Employee.fromJson(item)).toList();
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
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return BlockEmployee(employee: employees[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
