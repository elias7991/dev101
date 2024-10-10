import 'package:dev101/features/todo_management/domain/use_cases/use_cases.dart';
import 'package:dev101/features/todo_management/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final blocProviders = [
  BlocProvider(create: (_) => TodoBloc(
    todoUseCases: GetIt.I.get<TodoUseCases>(),
  )),
];
