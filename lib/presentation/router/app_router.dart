import 'package:flutter/material.dart';
import 'router_screen.dart';

class AppRouter {
  Route OnGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const FirstScreen(
            title: 'First Screen',
            color: Colors.blueAccent,
          ),
        );
      case '/secondScreen':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second Screen',
            color: Colors.redAccent,
            // homeScreenKey: key,
          ),
        );
      case '/thirdScreen':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third Screen',
            color: Colors.deepPurpleAccent,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const FirstScreen(
            title: 'First Screen',
            color: Colors.greenAccent,
          ),
        );
    }
  }
}
