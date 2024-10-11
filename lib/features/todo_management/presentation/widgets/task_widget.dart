import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/presentation/bloc/bloc.dart';
import 'package:dev101/features/todo_management/presentation/helpers/helpers.dart';
import 'package:dev101/features/todo_management/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    required this.tasks,
    super.key,
  });

  final List<TaskEntity> tasks;

  @override
  Widget build(BuildContext context) {
    final todo = context.read<TodoBloc>().state.tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(task.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descripción: ${task.description}'),
                SizedBox(
                  height: 8.h,
                ),
                Text('Prioridad: ${getPriorityInSpanish(task.priority)}')
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'edit') {
                  context.pushNamed(
                    TaskScreen.routeName,
                    extra: {
                      'task': task,
                    },
                  );
                } else if (value == 'delete') {
                  if (todo != null) {
                    context
                        .read<TodoBloc>()
                        .add(UpdateTodo(todo: todo.deleteTaskByID(task.id)));
                  }
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Modificar'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Eliminar'),
                  ),
                ];
              },
            ),
          ),
        );
      },
    );
  }
}
