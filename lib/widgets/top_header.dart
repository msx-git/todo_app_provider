import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/active_todo_count.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Text(
          '${context.watch<ActiveTodoCount>().state.activeTodoCount} item left',
          style: const TextStyle(
              fontSize: 20,
              color: Colors.redAccent
          ),
        ),
      ],
    );
  }
}
