import 'package:dev101/features/todo_management/data/data_sources/data_sources.dart';
import 'package:dev101/features/todo_management/data/repositories/todo_repository_impl.dart';
import 'package:dev101/features/todo_management/domain/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

Future<void> registerRepositories() async {
  GetIt.I.registerSingleton<TodoRepository>(
    TodoRepositoryImpl(
      todoDataSource: GetIt.I.get<TodoDataSource>(),
      prefsDataSource: GetIt.I.get<SharedPreferencesDataSource>(),  
    ),
  );
}
