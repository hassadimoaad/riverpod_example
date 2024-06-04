import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_marvel/src/todo_feature/todo.dart';

/// The currently active filter.
///
/// We use [StateProvider] here as there is no fancy logic behind manipulating
/// the value since it's just enum.
final todoListFilter = StateProvider((_) => TodoListFilter.all);

final filterdTodos = Provider<List<Todo>>((ref) {
  final fillter = ref.watch(todoListFilter);
});
