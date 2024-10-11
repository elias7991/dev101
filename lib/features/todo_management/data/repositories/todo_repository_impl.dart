import 'package:dartz/dartz.dart';
import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/features/todo_management/data/data_sources/data_sources.dart';
import 'package:dev101/features/todo_management/data/models/models.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/domain/repositories/repositories.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({
    required this.todoDataSource,
    required this.prefsDataSource,
  });

  final TodoDataSource todoDataSource;
  final SharedPreferencesDataSource prefsDataSource;

  @override
  Future<LR<TodoEntity>> fetchTodo() async {
    return todoDataSource.fetchTasks().then(
        (value) => value.fold((l) => left(l), (r) => right(r.toEntity())));
  }

  @override
  Future<TodoEntity?> fetchTodoFromPreferences() async {
    return prefsDataSource.getTasks().then(
          (value) => value?.toEntity(),
        );
  }

  @override
  Future<void> saveTodos(TodoEntity todo) async {
    return prefsDataSource.setTasks(TodoModel.fromEntity(todo));
  }
}
