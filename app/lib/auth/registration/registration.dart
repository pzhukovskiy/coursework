import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Flutter code sample for [Form].

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  
  Future<void> sendPostRequest() async {
    var response = await http.post(
      //https://api.dionisiubrovka.online/api/v1/teachers/
      //79dbae9a4a3b2e4553f961f9d2ad676cd69977ee
      Uri.parse('http://localhost:8000/api/v1/auth/users/'),
      body: {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text
      },
    );

    if (response.statusCode == 201) {
      print("success");
    } else {
      print("bad");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Форма"),
      ),
      body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Почта',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: 'Пароль',
            ),
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              hintText: 'Никнейм',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("success");
                  sendPostRequest();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
