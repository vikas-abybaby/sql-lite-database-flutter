import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Router/routing_service.dart';
import 'package:todo/Router/page_router_name.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/views/screens/add_todo_screen.dart';
import 'package:todo/views/screens/home_screen.dart';
import 'package:todo/views/screens/list_todo_screen.dart';
import 'package:todo/views/screens/splash_screen.dart';

class PageRouter {
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();
  GoRouter goRouter = GoRouter(
    navigatorKey: RoutingService.navigatorKey,
    initialLocation: Routes.splashScreen.path,
    debugLogDiagnostics: true,
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const Scaffold(body: Center(child: Text("Page Not Found"))),
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: Routes.todoListScreen.path,
        name: Routes.todoListScreen.name,
        builder: (BuildContext context, GoRouterState state) =>
            const TodoListScreen(),
      ),
      GoRoute(
        path: Routes.todoAddScreen.path,
        name: Routes.todoAddScreen.name,
        builder: (BuildContext context, GoRouterState state) => AddTodoScreen(
          todo: state.uri.queryParameters["todo"] != null
              ? Todo.fromJson(
                  jsonDecode(
                    state.uri.queryParameters["todo"] ?? "",
                  ),
                )
              : null,
        ),
      ),
      GoRoute(
        path: Routes.homeScreen.path,
        name: Routes.homeScreen.name,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
    ],
  );
}
