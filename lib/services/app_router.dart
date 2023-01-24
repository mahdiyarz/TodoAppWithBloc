import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/recycle_bin_screen.dart';
import 'package:todo_bloc/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RecycleBinScreen(),
        );
      case TasksScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );

      default:
        return null;
    }
  }
}
