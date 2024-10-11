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
          elevation: 0,
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state.todoState == BlocStateEnum.loading) {
              context.loaderOverlay.show();
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
                    // filter
                    Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filtrar por prioridad',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<TaskPriorityEnum>(
                              value: _selectedPriority,
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.deepPurpleAccent,
                              ),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.w500,
                              ),
                              items: TaskPriorityEnum.values.map((priority) {
                                return DropdownMenuItem<TaskPriorityEnum>(
                                  value: priority,
                                  child: Text(
                                    getPriorityInSpanish(priority),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedPriority = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Todo List
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
                child: Text(
                  'Error al cargar',
                  style: TextStyle(color: Colors.redAccent),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            context.pushNamed(TaskScreen.routeName);
          },
          backgroundColor: Colors.deepPurpleAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
