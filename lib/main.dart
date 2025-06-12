import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Router/page_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controllers/network/network_state.dart';
import 'package:todo/controllers/sync/sync_bloc.dart';
import 'package:todo/controllers/sync/sync_event.dart';
import 'package:todo/controllers/todo/todo_bloc.dart';
import 'package:todo/controllers/network/network_bloc.dart';
import 'package:todo/controllers/network/network_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final networkBloc = NetworkBloc()..add(NetworkStarted());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NetworkBloc>(
          create: (context) => networkBloc,
        ),
        BlocProvider<SyncBloc>(
          create: (context) => SyncBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(
            networkBloc: context.read<NetworkBloc>(),
          ),
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
