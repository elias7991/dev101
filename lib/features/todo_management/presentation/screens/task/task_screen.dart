import 'package:dev101/features/todo_management/data/enums/enums.dart';
import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/presentation/screens/task/task_body_screen.dart';
import 'package:dev101/features/todo_management/presentation/screens/task/task_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    this.task,
    super.key,
  });

  final TaskEntity? task;

  static const routePath = '/task';
  static const routeName = 'task';

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TextEditingController _titleEditingController;
  late TextEditingController _descriptionEditingController;
  late ValueNotifier<TaskPriorityEnum?> _priorityNotifier;

  @override
  void initState() {
    super.initState();
    _titleEditingController =
        TextEditingController(text: widget.task?.title ?? '');
    _descriptionEditingController =
        TextEditingController(text: widget.task?.description ?? '');

    _priorityNotifier = ValueNotifier(widget.task?.priority);
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
    _priorityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tarea'),
          elevation: 0,
          backgroundColor: Colors.deepPurple.shade500,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: TaskScreenBody(
            titleController: _titleEditingController,
            descriptionController: _descriptionEditingController,
            priority: _priorityNotifier,
            idToUpdate: widget.task?.id,
          ),
        ),
        floatingActionButton: TaskButton(
          titleController: _titleEditingController,
          descriptionController: _descriptionEditingController,
          selectedPriority: _priorityNotifier,
          idToUpdate: widget.task?.id,
        ),
      ),
    );
  }
}
