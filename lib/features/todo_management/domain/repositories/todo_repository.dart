import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';

abstract class TodoRepository {
  Future<LR<TodoEntity>> fetchTodo();
  Future<TodoEntity?> fetchTodoFromPreferences();
  Future<void> saveTodos(TodoEntity todo);
}
