import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final List<TaskEntity> todo;

  const TodoEntity({required this.todo});

  factory TodoEntity.empty() {
    return const TodoEntity(todo: []);
  }

  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    List<dynamic> taskJsonList = json['todo'] as List<dynamic>;
    List<TaskEntity> tasks = taskJsonList
        .map(
            (taskJson) => TaskEntity.fromJson(taskJson as Map<String, dynamic>))
        .toList();

    return TodoEntity(todo: tasks);
  }

  Map<String, dynamic> toJson() {
    return {
      'todo': todo.map((task) => task.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [todo];
}
