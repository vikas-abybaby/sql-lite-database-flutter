import 'package:todo/models/todo_model.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;
  AddTodoEvent(this.todo);
}
class UpdateTodoEvent extends TodoEvent {
  final Todo todo;
  UpdateTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final int id;
  DeleteTodoEvent(this.id);
}
