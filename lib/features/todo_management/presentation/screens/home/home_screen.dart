import 'package:dev101/features/todo_management/data/enums/enums.dart';
import 'package:dev101/features/todo_management/presentation/bloc/bloc.dart';
import 'package:dev101/features/todo_management/presentation/enums/enums.dart';
import 'package:dev101/features/todo_management/presentation/helpers/helpers.dart';
import 'package:dev101/features/todo_management/presentation/screens/screens.dart';
import 'package:dev101/features/todo_management/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskPriorityEnum _selectedPriority = TaskPriorityEnum.empty;

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodo());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state.todoState == BlocStateEnum.loading) {
              context.loaderOverlay.show();
            } else if (state.todoState == BlocStateEnum.error) {
              context.loaderOverlay.hide();
            } else if (state.todoState == BlocStateEnum.loaded) {
              context.loaderOverlay.hide();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            if (state.todoState == BlocStateEnum.loaded) {
              final filteredTasks = _selectedPriority == TaskPriorityEnum.empty
                  ? state.tasks?.todo ?? []
                  : state.tasks?.todo
                          .where((task) => task.priority == _selectedPriority)
                          .toList() ??
                      [];

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Prioridad'),
                        SizedBox(width: 25.w),
                        DropdownButton<TaskPriorityEnum>(
                          value: _selectedPriority,
                          items: TaskPriorityEnum.values.map((priority) {
                            return DropdownMenuItem<TaskPriorityEnum>(
                              value: priority,
                              child: Text(getPriorityInSpanish(priority)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPriority = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: TaskWidget(
                        tasks: filteredTasks,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.todoState == BlocStateEnum.error) {
              return const Center(
                child: Text('Error al cargar'),
              );
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(TaskScreen.routeName);
          },
          mini: true,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
