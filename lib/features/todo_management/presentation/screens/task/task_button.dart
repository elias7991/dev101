import 'package:dev101/features/todo_management/data/enums/enums.dart';
import 'package:dev101/features/todo_management/presentation/bloc/bloc.dart';
import 'package:dev101/features/todo_management/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';

class TaskButton extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueNotifier<TaskPriorityEnum?> selectedPriority;
  final String? idToUpdate;

  const TaskButton({
    required this.titleController,
    required this.descriptionController,
    required this.selectedPriority,
    this.idToUpdate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = context.read<TodoBloc>().state.tasks ?? TodoEntity.empty();

    return FloatingActionButton(
      onPressed: () {
        if (idToUpdate != null) {
          final updatedTask = TaskEntity(
            id: idToUpdate!,
            title: titleController.text,
            description: descriptionController.text,
            priority: selectedPriority.value!,
            state: TaskStateEnum.todo,
          );

          context
              .read<TodoBloc>()
              .add(UpdateTodo(todo: todo.updateTaskByID(updatedTask)));
        } else {
          final newID = generateTaskID(todo.todo);
          final newTask = TaskEntity(
            id: newID,
            title: titleController.text,
            description: descriptionController.text,
            priority: selectedPriority.value!,
            state: TaskStateEnum.todo,
          );

          context.read<TodoBloc>().add(UpdateTodo(todo: todo.addTask(newTask)));
        }
      },
      backgroundColor: Colors.deepPurple.shade500,
      child: Icon(
        idToUpdate == null ? Icons.save : Icons.edit,
        color: Colors.white,
      ),
    );
  }
}
