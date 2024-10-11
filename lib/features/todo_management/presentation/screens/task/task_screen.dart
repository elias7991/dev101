import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/presentation/screens/task/task_body_screen.dart';
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

  @override
  void initState() {
    super.initState();

    _titleEditingController =
        TextEditingController(text: widget.task?.title ?? '');
    _descriptionEditingController =
        TextEditingController(text: widget.task?.description ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tarea'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          child: TaskScreenBody(
            titleController: _titleEditingController,
            descriptionController: _descriptionEditingController,
          ),
        ),
      ),
    );
  }
}
