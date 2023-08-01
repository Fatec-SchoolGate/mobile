import 'package:flutter/material.dart';
import 'package:presence_auth_mobile/views/login/form.dart';
import 'package:presence_auth_mobile/views/login/waves.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: LoginWaves()
      body: Column(
        children: [
          LoginWaves(),
          LoginForm()
        ],
      ),
    );
  }
}