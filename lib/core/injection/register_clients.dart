import 'package:dev101/core/network/clients/clients.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> registerClients({
  required Dio dio,
}) async {
  // http client injection
  GetIt.I.registerSingleton<DioClient>(
    DioClient(dio),
  );
}
