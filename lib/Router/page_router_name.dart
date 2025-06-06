class PageRouterName {
  final String name;
  final String path;
  const PageRouterName({
    required this.name,
    required this.path,
  });
}

class Routes {
  static const PageRouterName splashScreen = PageRouterName(
    name: "splash_screen",
    path: "/splash_screen",
  );

  static const PageRouterName homeScreen = PageRouterName(
    name: "home_screen",
    path: "/home_screen",
  );
  static const PageRouterName todoAddScreen = PageRouterName(
    name: "todo_add_screen",
    path: "/todo_add_screen",
  );
  static const PageRouterName todoListScreen = PageRouterName(
    name: "todo_list_screen",
    path: "/todo_list_screen",
  );
}
