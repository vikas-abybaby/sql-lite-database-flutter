import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Router/page_router_name.dart';
import 'package:todo/Router/routing_service.dart';
import 'package:todo/controllers/todo/todo_bloc.dart';
import 'package:todo/controllers/todo/todo_event.dart';
import 'package:todo/controllers/todo/todo_state.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/views/widgets/color_const.dart';
import 'package:todo/views/widgets/widget.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: barlowBold(text: "Todo List Screens", color: white, size: 18),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          log("message${state.toString()}");
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            final todos = state.todos;
            if (todos.isEmpty) {
              return const Center(child: Text('No Todos found.'));
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todo todo = todos[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: todo.isDeleted == 1
                        ? red.withOpacity(.3)
                        : todo.isEdit == 1
                            ? green
                            : black.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: barlowBold(
                                    text: todo.title ?? "",
                                    color: black,
                                    size: 18,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    RoutingService().pushNamed(
                                        Routes.todoAddScreen.name,
                                        queryParameters: {
                                          "todo": jsonEncode(todo.toJson())
                                        });
                                  },
                                  icon: Icon(
                                    Icons.edit_square,
                                    color: black,
                                    size: 25,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    RoutingService.navigatorKey.currentContext!
                                        .read<TodoBloc>()
                                        .add(DeleteTodoEvent(todo.id!));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: black,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            barlowRegular(
                                text: todo.description ?? "",
                                color: black,
                                size: 12),
                            barlowRegular(
                                text: "Date: ${todo.dateTime ?? ""}",
                                color: black,
                                size: 12),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTodoScreen()),
          );

          // Reload the list after returning from AddTodoScreen
          if (result != null && result == true) {
            context.read<TodoBloc>().add(LoadTodos());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
