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
  late Future<List<Employee>> futureEmployees;

  @override
  void initState() {
    super.initState();
    futureEmployees = fetchData();
  }

  Future<List<Employee>> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/employees'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return data.map((item) => Employee.fromJson(item)).toList();
    } else {
      throw Exception('Невозможно получить данные');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: futureEmployees,
              builder: (context, AsyncSnapshot<List<Employee>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Данные недоступны'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return BlockEmployee(
                        employee: snapshot.data![index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
