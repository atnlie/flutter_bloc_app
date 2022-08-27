import 'package:flutter/material.dart';
import 'router_screen.dart';

class AppRouter {
  Route? OnGenerateRoute(RouteSettings settings) {
    // final GlobalKey<ScaffoldState> key = settings.arguments;
    print('settings -> $settings');
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
            color: Colors.blueAccent,
          ),
        );
      default:
        // return MaterialPageRoute(
        //   builder: (_) => const FirstScreen(
        //     title: 'First Screen',
        //     color: Colors.blueAccent,
        //   ),
        // );
        return null;
    }
  }
}
