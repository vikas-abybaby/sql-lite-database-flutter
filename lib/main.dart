import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Router/page_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/database/database_helper.dart';
import 'package:todo/controllers/network/network_bloc.dart';
import 'package:todo/controllers/network/network_event.dart';

late Database _database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _database = await LocalDatabase().initDatabase();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(NetworkStarted()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoRouter router = PageRouter().goRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
