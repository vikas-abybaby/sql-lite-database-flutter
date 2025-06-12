import 'dart:convert';
import 'dart:developer';
import 'add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/views/widgets/widget.dart';
import 'package:todo/Router/routing_service.dart';
import 'package:todo/Router/page_router_name.dart';
import 'package:todo/views/widgets/color_const.dart';
import 'package:todo/controllers/todo/todo_bloc.dart';
import 'package:todo/controllers/todo/todo_event.dart';
import 'package:todo/controllers/todo/todo_state.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      RoutingService.navigatorKey.currentContext!
          .read<TodoBloc>()
          .add(LoadTodos());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: barlowBold(
          text: "Todo List Screens",
          color: white,
          size: 18,
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoaded) {
            final todos = state.todos;
            if (todos.isEmpty) {
              return Center(
                child: barlowBold(
                  text: 'No Todos found.',
                  color: black,
                  size: 18,
                ),
              );
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todo todo = todos[index];

                log("message1111${todo.productId} : ${todo.isEdit}");
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
                                      },
                                    );
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
                              size: 12,
                            ),
                            barlowRegular(
                              text: "Date: ${todo.dateTime ?? ""}",
                              color: black,
                              size: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(
              child: barlowBold(
                text: state.message,
                color: black,
                size: 20,
              ),
            );
          } else {
            return Center(
              child: barlowBold(
                text: 'Something went wrong.',
                color: black,
                size: 20,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () async {
          final result =
              await RoutingService().pushNamed(Routes.todoAddScreen.name);
          if (result != null && result == true) {
            RoutingService.navigatorKey.currentContext!
                .read<TodoBloc>()
                .add(LoadTodos());
          }
        },
        child: Icon(
          Icons.add,
          color: white,
          size: 22,
        ),
      ),
    );
  }
}
