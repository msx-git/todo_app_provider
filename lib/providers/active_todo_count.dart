import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app_provider/providers/todo_list.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({required this.activeTodoCount});

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

class ActiveTodoCount with ChangeNotifier {
  ActiveTodoCountState _state = ActiveTodoCountState.initial();
  ActiveTodoCountState get state => _state;

  void update(TodoList todoList) {
    final int newActiveTodoCount = todoList.state.todos
        .where((element) => !element.completed)
        .toList()
        .length;
    _state = _state.copyWith(activeTodoCount: newActiveTodoCount);
    notifyListeners();
  }
}
