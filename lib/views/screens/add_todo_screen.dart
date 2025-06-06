import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Router/routing_service.dart';
import 'package:todo/controllers/todo/todo_bloc.dart';
import 'package:todo/controllers/todo/todo_event.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/views/widgets/color_const.dart';
import 'package:todo/views/widgets/widget.dart';

class AddTodoScreen extends StatefulWidget {
  final Todo? todo;
  const AddTodoScreen({super.key, this.todo});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  void _saveTodo() {
    if (_formKey.currentState!.validate()) {
      if (widget.todo != null) {
        final updatedTodo = widget.todo?.copyWith(
          title: _titleController.text,
          description: _descController.text,
          isEdit: 1,
        );
        context.read<TodoBloc>().add(UpdateTodoEvent(updatedTodo!));
      } else {
        final todo = Todo(
          title: _titleController.text,
          description: _descController.text,
          dateTime: DateTime.now().toString(),
        );

        context.read<TodoBloc>().add(AddTodoEvent(todo));
      }
    }
    RoutingService().goBack();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      updatedTodo();
    });
  }

  void updatedTodo() {
    if (widget.todo != null) {
      _titleController.text = widget.todo?.title ?? "";
      _descController.text = widget.todo?.description ?? "";
    }
    setState(() {});
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: white,
        ),
        backgroundColor: black,
        title: barlowBold(text: "Todo Add Screens", color: white, size: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter title" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter description" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTodo,
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
