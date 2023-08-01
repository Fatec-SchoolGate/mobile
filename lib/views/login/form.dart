import 'package:flutter/material.dart';
import 'package:presence_auth_mobile/core/components/button/button.dart';
import 'package:presence_auth_mobile/core/components/button/text_field.dart';
import 'package:presence_auth_mobile/views/login/services/login_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

final _formKey = GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {

  String email = "";
  String password = "";

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LoginService().signIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 100),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextInputField(
              hintText: "Email",
              prefixIconData: Icons.lock_outline,
              onSaved: (value) => setState(() => email = value ?? ""),
            ),
            TextInputField(
              obscureText: true,
              hintText: "Password",
              prefixIconData: Icons.email_outlined,
              onSaved: (value) => setState(() => password = value ?? ""),
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: Text("Sign in")
            )
          ].map((widget) => Container(margin: const EdgeInsets.all(5), child: widget)).toList(),
        )
      ),
    );
  }
}