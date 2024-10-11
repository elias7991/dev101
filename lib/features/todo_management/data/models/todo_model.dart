import 'package:dev101/features/todo_management/data/models/models.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';

class TodoModel {
  final List<TaskModel> todo;

  TodoModel({required this.todo});

  factory TodoModel.fromJson(List<dynamic> data) {
    return TodoModel(
        todo: data.map((task) => TaskModel.fromJson(task)).toList());
  }

  List<Map<String, dynamic>> toJson() {
    return todo.map((task) => task.toJson()).toList();
  }

  TodoEntity toEntity() {
    return TodoEntity(todo: todo.map((task) => task.toEntity()).toList());
  }

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      todo: entity.todo.map((task) => TaskModel.fromEntity(task)).toList(),
    );
  }

}
