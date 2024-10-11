import 'package:dev101/features/todo_management/data/enums/enums.dart';

String getPriorityInSpanish(TaskPriorityEnum priority) {
  switch (priority) {
    case TaskPriorityEnum.empty:
      return '';
    case TaskPriorityEnum.low:
      return 'Baja';
    case TaskPriorityEnum.medium:
      return 'Media';
    case TaskPriorityEnum.high:
      return 'Alta';
  }
}

TaskPriorityEnum getPriorityFromString(String priority) {
  switch (priority.toLowerCase()) {
    case 'alta':
      return TaskPriorityEnum.high;
    case 'media':
      return TaskPriorityEnum.medium;
    case 'baja':
      return TaskPriorityEnum.low;
    default:
      return TaskPriorityEnum.empty;
  }
}

