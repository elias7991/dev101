import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/domain/repositories/repositories.dart';

class TodoUseCases {
  const TodoUseCases({
    required this.repository,
  });

  final TodoRepository repository;

  // define the use cases
  Future<LR<TodoEntity>> todoUseCase() async {
    return repository.fetchTodo();
  }

  Future<TodoEntity?> todoFromPrefsUseCase() async {
    return repository.fetchTodoFromPreferences();
  }

  Future<void> saveTodoUseCase(TodoEntity todo) async {
    return repository.saveTodos(todo);
  }
}
