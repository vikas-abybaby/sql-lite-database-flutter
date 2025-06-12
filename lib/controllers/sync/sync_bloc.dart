import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Router/routing_service.dart';
import 'package:todo/controllers/todo/todo_bloc.dart';
import 'package:todo/controllers/todo/todo_event.dart';
import 'package:todo/models/todo_model.dart';
import 'sync_event.dart';
import 'sync_state.dart';
import 'package:todo/database/database_helper.dart';
import 'package:todo/repositories/servers/todo_server.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SyncBloc() : super(SyncInitial()) {
    on<StartSync>(_onStartSync);
  }

  Future<void> _onStartSync(StartSync event, Emitter<SyncState> emit) async {
    emit(SyncInProgress());
    log("🔄 Sync started...");

    try {
      final unsyncedTodos = await LocalDatabase.getUnsyncedTodos();
      log("🗂 Fetched unsynced todos: ${unsyncedTodos.length}");

      if (unsyncedTodos.isNotEmpty) {
        List<Todo> todoData =
            List.from(unsyncedTodos.map((e) => Todo.fromJson(e)));

        for (final todo in todoData) {
          log("🚀 Syncing todo [Local ID: ${todo.id}]...");

          try {
            // ✅ Send the todo to server
            final serverId = await TodoServer.addData(); // Make sure this method accepts a Todo

            // log("✅ Server responded with productId: $serverId");

            // if (serverId != null) {
            // ✅ Update local DB with server productId
            await LocalDatabase.updateProductId(
              id: todo.id ?? 0,
              productId: "serverId",
            );

            log("💾 Updated local todo [ID: ${todo.id}] with server productId: $serverId");
            // }
          } catch (e) {
            log("❌ Failed to sync individual todo [ID: ${todo.id}]: $e");
          }
        }

        // ✅ Refresh TodoBloc state
        final context = RoutingService.navigatorKey.currentContext;
        if (context != null) {
          RoutingService.navigatorKey.currentContext!
              .read<TodoBloc>()
              .add(LoadTodos());
          log("🔄 TodoBloc reloaded after sync.");
        }
      } else {
        log("✔️ No unsynced todos to sync.");
      }

      emit(SyncSuccess());
      log("🎉 Sync completed successfully.");
    } catch (e) {
      log("❌ Failed to complete sync: $e");
      emit(SyncFailure("Error syncing data"));
    }
  }
}
