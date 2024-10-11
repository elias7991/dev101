import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/core/services/services.dart';
import 'package:dev101/features/todo_management/data/data_sources/data_sources.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDataSources({
  required DioClient dio,
  required SharedPreferencesService prefs,
}) async {
  GetIt.I.registerSingleton<TodoDataSource>(
    TodoRemoteDataSource(client: dio),
  );
  GetIt.I.registerSingleton<SharedPreferencesDataSource>(
    SharedPreferencesLocalDataSource(prefs: prefs)
  );
}
