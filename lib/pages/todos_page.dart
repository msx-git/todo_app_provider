import 'package:flutter/material.dart';
import 'package:todo_app_provider/widgets/search_and_filter.dart';
import 'package:todo_app_provider/widgets/show_todos.dart';
import 'package:todo_app_provider/widgets/widgets.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: const [
            TopHeader(),
            CreateTodo(),
            SearchAndFilter(),
            ShowTodos(),
          ],
        ),
      ),
    );
  }
}

