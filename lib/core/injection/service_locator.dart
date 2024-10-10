import 'package:dev101/core/injection/register_clients.dart';
import 'package:dev101/core/injection/register_data_sources.dart';
import 'package:dev101/core/injection/register_repositories.dart';
import 'package:dev101/core/injection/register_use_cases.dart';
import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/core/network/clients/dio/dio_options.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance();

Future<void> setUpDependencies() async {
  final dio =
      Dio(DioOptions(baseUrl: 'https://65f43f68f54db27bc02120e0.mockapi.io'));

  // http clients, register
  await registerClients(dio: dio);

  // data sources, dependency injection register
  await registerDataSources(dio: GetIt.I.get<DioClient>());

  // repositories, dependency injection register
  await registerRepositories();

  // use cases, dependency injection register
  await registerUseCases();
}
