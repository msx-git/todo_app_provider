import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/providers.dart';
import 'package:todo_app_provider/widgets/todo_item.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodos>().state.filteredTodos;
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            key: ValueKey(todos[index].id),
            onDismissed: (_) {
              context.read<TodoList>().removeTodo(todos[index]);
            },
            confirmDismiss: (_) {
              return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you really want to delete?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('NO'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('YES'),
                      )
                    ],
                  );
                },
              );
            },
            child: TodoItem(todo: todos[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.grey);
      },
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
