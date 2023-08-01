import 'package:flutter/material.dart';
import 'package:presence_auth_mobile/router_generator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Placeholder(),
        initialRoute: "login",
        onGenerateRoute: RouterGenerator.generate,
      ),
    );
  }
}
