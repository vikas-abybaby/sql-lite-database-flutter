import 'dart:developer';
import 'todo_event.dart';
import 'todo_state.dart';
import 'package:todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/database/database_helper.dart';
import 'package:todo/controllers/network/network_bloc.dart';
import 'package:todo/repositories/servers/todo_server.dart';
import 'package:todo/controllers/network/network_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final NetworkBloc networkBloc;
  TodoBloc({required this.networkBloc}) : super(TodoInitial()) {
    on<LoadTodos>(_loadTodos);
    on<AddTodoEvent>(_addTodo);
    on<UpdateTodoEvent>(_updateTodo);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  Future<void> _loadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final networkStatus = networkBloc.state.status;
      final data = await LocalDatabase.getTodos();
      log("Fun Calling$data");
      List<Todo> localTodos = [];
      if (networkStatus == NetworkStatus.connected) {
        log("NetworkStatus connected");
        final serverTodos = await TodoServer.getData(showLoader: data.isEmpty);
        if (data.isNotEmpty && serverTodos is List) {
          await LocalDatabase.clearAllTodos();
          for (var todo in serverTodos) {
            await LocalDatabase.insertTodo(todo);
          }
        } else {
          localTodos = List.from(data.map((e) => Todo.fromJson(e)));
        }
      } else {
        log("NetworkStatus Deconnected");
        localTodos = List.from(data.map((e) => Todo.fromJson(e)));
      }

      emit(TodoLoaded(localTodos));
    } catch (e) {
      log("Error$e");
      emit(TodoError("Failed to load todos"));
    }
  }

  Future<void> _addTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await LocalDatabase.insertTodo(event.todo);
      final todos = await LocalDatabase.getTodos();
      log("message$todos");
      emit(TodoLoaded(List.from(todos.map((e) => Todo.fromJson(e)))));
    } catch (e) {
      emit(TodoError("Failed to add todo"));
    }
  }

  Future<void> _updateTodo(
      UpdateTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await LocalDatabase.updateTodo(event.todo);
      final todos = await LocalDatabase.getTodos();
      emit(TodoLoaded(List.from(todos.map((e) => Todo.fromJson(e)))));
    } catch (e) {
      emit(TodoError("Failed to update todo"));
    }
  }

  Future<void> _deleteTodo(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await LocalDatabase.softDelete(event.id);
      final todos = await LocalDatabase.getTodos();
      emit(TodoLoaded(List.from(todos.map((e) => Todo.fromJson(e)))));
    } catch (e) {
      emit(TodoError("Failed to delete todo"));
    }
  }
}
