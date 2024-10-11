import 'package:dev101/features/todo_management/domain/entities/entities.dart';

String generateTaskID(List<TaskEntity> tasks) {
  if (tasks.isEmpty) return '1';

  final existingIDs = tasks.map((task) => int.parse(task.id)).toList();
  final maxID = existingIDs.reduce((a, b) => a >= b ? a : b);

  return (maxID + 1).toString();
}
