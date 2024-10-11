import 'package:dev101/features/todo_management/data/enums/enums.dart';

String getPriorityInSpanish(TaskPriorityEnum priority) {
  switch (priority) {
    case TaskPriorityEnum.empty:
      return 'Ninguno';
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
    case 'alta' || 'high':
      return TaskPriorityEnum.high;
    case 'media' || 'medium':
      return TaskPriorityEnum.medium;
    case 'baja' || 'low':
      return TaskPriorityEnum.low;
    default:
      return TaskPriorityEnum.empty;
  }
}

