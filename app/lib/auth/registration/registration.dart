import 'package:app/api/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool _isPasswordVisible = false;

  Future<void> sendPostRequest() async {
    var response = await http.post(
      Uri.parse('$URL/auth/users/'),
      body: {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      },
    );

    if (response.statusCode == 201) {
      _showSuccessDialog();
    } else {
      print("Ошибка регистрации");
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Регистрация прошла успешно"),
          content: Text("Вы успешно зарегистрировались!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                emailController.clear();
                passwordController.clear();
                usernameController.clear();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField(
                controller: emailController,
                hintText: 'Почта',
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: passwordController,
                hintText: 'Пароль',
                isPassword: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: usernameController,
                hintText: 'Никнейм',
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("success");
                    sendPostRequest();
                  }
                },
                child: const Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    Widget? suffixIcon,
  }) {
    final brightness = Theme.of(context).brightness;

    return TextField(
      controller: controller,
      obscureText: isPassword && !_isPasswordVisible,
      style: TextStyle(
          color: brightness == Brightness.dark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54),
        border: OutlineInputBorder(),
        filled: true,
        fillColor:
            brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
        suffixIcon: suffixIcon,
      ),
    );
  }
}
