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

  @override
  List<Object?> get props => [id, title, description, priority, state];
}
