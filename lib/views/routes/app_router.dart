import 'package:flutter/material.dart';
import 'package:labhouse_radio/views/screens/screens.dart';

class AppRouter 
{
  Route? onGenerateRoute(RouteSettings routeSettings) 
  {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/radio':
        return MaterialPageRoute(builder: (_) => RadioPlay());
      default:
        return null;
    }

  }  
}