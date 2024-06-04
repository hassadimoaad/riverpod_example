import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Todo {
  final String id;
  final String description;
  final bool isCompleted;
  const Todo({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return 'Todo(description: $description, completed: $isCompleted)';
  }
}

class TodoList extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [
        const Todo(id: 'todo-0', description: 'Buy cookies'),
        const Todo(id: 'todo-1', description: 'Star Riverpod'),
        const Todo(id: 'todo-2', description: 'Have a walk'),
      ];
  void add(String description) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            isCompleted: !todo.isCompleted,
            description: todo.description,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            isCompleted: todo.isCompleted,
            description: description,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
