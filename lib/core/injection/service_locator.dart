import 'package:dev101/core/injection/register_clients.dart';
import 'package:dev101/core/injection/register_data_sources.dart';
import 'package:dev101/core/injection/register_repositories.dart';
import 'package:dev101/core/injection/register_services.dart';
import 'package:dev101/core/injection/register_use_cases.dart';
import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/core/network/clients/dio/dio_options.dart';
import 'package:dev101/core/services/services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance();

Future<void> setUpDependencies() async {
  final dio =
      Dio(DioOptions(baseUrl: 'https://65f43f68f54db27bc02120e0.mockapi.io'));

  final prefs = await SharedPreferences.getInstance();

  // http clients, register
  await registerClients(dio: dio);

  // services register
  await registerServices(prefs: prefs);

  // data sources, dependency injection register
  await registerDataSources(
    dio: GetIt.I.get<DioClient>(),
    prefs: GetIt.I.get<SharedPreferencesService>(),
  );

  // repositories, dependency injection register
  await registerRepositories();

  // use cases, dependency injection register
  await registerUseCases();
}
