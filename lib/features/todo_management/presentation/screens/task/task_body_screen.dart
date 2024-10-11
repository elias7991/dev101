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
    required this.priority,
    this.idToUpdate,
    super.key,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueNotifier<TaskPriorityEnum?> priority;
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
    if (widget.priority.value != null) {
      _selectedPriority = widget.priority.value.toString().split('.').last;
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
                    widget.priority.value = getPriorityFromString(newValue!);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
