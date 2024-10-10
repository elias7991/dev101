import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final List<TaskEntity> todo;

  const TodoEntity({required this.todo});

  factory TodoEntity.empty() {
    return const TodoEntity(todo: []);
  }

  @override
  List<Object?> get props => [todo];
}
