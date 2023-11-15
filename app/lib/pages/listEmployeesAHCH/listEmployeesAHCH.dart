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
  late Future<List<EmployeeAHCH>> futureEmployeesAHCH;

  @override
  void initState() {
    super.initState();
    futureEmployeesAHCH = fetchData();
  }

  Future<List<EmployeeAHCH>> fetchData() async {
    final response = await http.get(
      Uri.parse('$URL/employeesahch'),
      headers: {
        'Authorization': 'Token $TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      return data.map((item) => EmployeeAHCH.fromJson(item)).toList();
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
              future: futureEmployeesAHCH,
              builder: (context, AsyncSnapshot<List<EmployeeAHCH>> snapshot) {
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
                      return BlockEmployeeAHCH(
                        employeeAHCH: snapshot.data![index],
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
