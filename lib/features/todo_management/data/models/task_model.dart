import 'package:dev101/features/todo_management/data/enums/enums.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String priority;
  final String? state;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.state,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: json['priority'] as String,
      state: json['state'] as String?,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      //TODO: could move to some helper and avoid using ternary
      priority: int.parse(priority.replaceAll(RegExp(r'\D'), '')) <= 3
        ? TaskPriorityEnum.low
        : int.parse(priority.replaceAll(RegExp(r'\D'), '')) >= 8
          ? TaskPriorityEnum.high
          : TaskPriorityEnum.medium,
      state: TaskStateEnum
        .values
        .firstWhere(
          (e) => e.toString() == 'TaskStateEnum.$state',
          orElse: () => TaskStateEnum.todo,
        ),
    );
  }
}
