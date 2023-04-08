import 'package:flutter/material.dart';

class AppRoute {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutess = {
      //initialRoute: (_) => const HomeScreen(),
    };
    return appRoutess;
  }
}
