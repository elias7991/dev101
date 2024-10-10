import 'package:dev101/features/todo_management/domain/repositories/repositories.dart';
import 'package:dev101/features/todo_management/domain/use_cases/use_cases.dart';
import 'package:get_it/get_it.dart';

Future<void> registerUseCases() async {
  GetIt.I.registerSingleton<TodoUseCases>(
    TodoUseCases(repository: GetIt.I.get<TodoRepository>())
  );
}
