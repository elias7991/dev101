import 'package:dartz/dartz.dart';
import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/features/todo_management/data/data_sources/data_sources.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/domain/repositories/repositories.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({
    required this.todoDataSource,
  });

  final TodoDataSource todoDataSource;

  @override
  Future<LR<TodoEntity>> fetchTodo() async {
    return todoDataSource.fetchTasks().then(
        (value) => value.fold((l) => left(l), (r) => right(r.toEntity())));
  }
}
