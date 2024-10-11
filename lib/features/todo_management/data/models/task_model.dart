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
      //TODO: fix this, don't use ternaries
      priority: json['priority'].contains(RegExp(r'[0-9]'))
          ? int.parse(json['priority'].replaceAll(RegExp(r'\D'), '')) <= 3
              ? TaskPriorityEnum.low.toString()
              : int.parse(json['priority'].replaceAll(RegExp(r'\D'), '')) >= 8
                  ? TaskPriorityEnum.high.toString()
                  : TaskPriorityEnum.medium.toString()
          : json['priority'],
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'state': state,
    };
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      priority: TaskPriorityEnum.values.firstWhere(
        (e) => e.toString() == priority,
        orElse: () => TaskPriorityEnum.low,
      ),
      state: TaskStateEnum.values.firstWhere(
        (e) => e.toString() == 'TaskStateEnum.$state',
        orElse: () => TaskStateEnum.todo,
      ),
    );
  }

  factory TaskModel.fromEntity(TaskEntity task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      priority: task.priority.toString(),
      state: task.state.toString(),
    );
  }
}
