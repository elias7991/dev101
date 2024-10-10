import 'package:dev101/features/todo_management/presentation/bloc/bloc.dart';
import 'package:dev101/features/todo_management/presentation/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Header Screen'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoState == BlocStateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.todoState == BlocStateEnum.error) {
            return const Center(
              child: Text('Error al cargar.'),
            );
          } else if (state.todoState == BlocStateEnum.loaded) {
            return Center(
              child: Text('se encontraron ${state.tasks?.todo.length} datos'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
