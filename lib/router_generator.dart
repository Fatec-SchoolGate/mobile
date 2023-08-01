import 'package:flutter/material.dart';
import 'package:presence_auth_mobile/screens/login/login.dart';

class RouteProps {
  late final Widget component;
  bool authGuard = true;//if sets true, only authed users will be allowed to see
  bool guestGuard = false;//if sets true, only non authed users will be allowed see
}

class RouterGenerator {

  static Map<String, RouteProps> routes = {
    "login": RouteProps()
      ..component = LoginPage(),
  };

  static Route<dynamic> generate(RouteSettings settings) {
    RouteProps? route = routes[settings.name];

    if (route != null) {
      return MaterialPageRoute(builder: (_) => route.component);
    }

    return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}