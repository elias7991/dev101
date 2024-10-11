import 'package:dev101/features/todo_management/data/enums/enums.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final TaskPriorityEnum priority;
  final TaskStateEnum state;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.state,
  });

  factory TaskEntity.empty() {
    return const TaskEntity(
      id: '0',
      title: '',
      description: '',
      priority: TaskPriorityEnum.empty,
      state: TaskStateEnum.todo,
    );
  }

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: TaskPriorityEnum.values.firstWhere(
        (e) => e.toString() == json['priority'],
        orElse: () => TaskPriorityEnum.low,
      ),
      state: TaskStateEnum.values.firstWhere(
        (e) => e.toString() == json['state'],
        orElse: () => TaskStateEnum.todo,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority.toString(),
      'state': state.toString(),
    };
  }

  @override
  List<Object?> get props => [id, title, description, priority, state];
}
