import 'package:dev101/features/todo_management/data/enums/enums.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/presentation/bloc/bloc.dart';
import 'package:dev101/features/todo_management/presentation/enums/enums.dart';
import 'package:dev101/features/todo_management/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class TaskScreenBody extends StatefulWidget {
  const TaskScreenBody({
    required this.titleController,
    required this.descriptionController,
    this.priority,
    this.idToUpdate,
    super.key,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TaskPriorityEnum? priority;
  final String? idToUpdate;

  @override
  State<TaskScreenBody> createState() => _TaskScreenBodyState();
}

class _TaskScreenBodyState extends State<TaskScreenBody> {
  late TodoEntity todo;
  String? _selectedPriority;

  @override
  void initState() {
    super.initState();
    todo = context.read<TodoBloc>().state.tasks ?? TodoEntity.empty();
    if (widget.priority != null) {
      _selectedPriority = widget.priority.toString().split('.').last;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state.todoState == BlocStateEnum.loading) {
          context.loaderOverlay.show();
        } else if (state.todoState == BlocStateEnum.loaded) {
          context.loaderOverlay.hide();
          context.pop();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              // title input
              TextField(
                controller: widget.titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.h),
              // description input
              TextField(
                controller: widget.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.h),
              // priority selector
              DropdownButtonFormField<String>(
                value: _selectedPriority,
                decoration: const InputDecoration(
                  labelText: 'Prioridad',
                  border: OutlineInputBorder(),
                ),
                items: priorityOptions.map((priority) {
                  return DropdownMenuItem<String>(
                    value: priority['value'],
                    child: Text(priority['label']!),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedPriority = newValue;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                if (widget.idToUpdate != null) {
                  final updatedTask = TaskEntity(
                    id: widget.idToUpdate!,
                    title: widget.titleController.text,
                    description: widget.descriptionController.text,
                    priority: getPriorityFromString(_selectedPriority ?? 'low'),
                    state: TaskStateEnum.todo,
                  );

                  context
                      .read<TodoBloc>()
                      .add(UpdateTodo(todo: todo.updateTaskByID(updatedTask)));
                } else {
                  final newID = generateTaskID(todo.todo);
                  final newTask = TaskEntity(
                    id: newID,
                    title: widget.titleController.text,
                    description: widget.descriptionController.text,
                    priority: getPriorityFromString(_selectedPriority ?? 'low'),
                    state: TaskStateEnum.todo,
                  );

                  context
                      .read<TodoBloc>()
                      .add(UpdateTodo(todo: todo.addTask(newTask)));
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                backgroundColor: Colors.deepPurple.shade500,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 8.w,
                ),
                child: Text(
                  widget.idToUpdate == null ? 'Agregar' : 'Modificar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
