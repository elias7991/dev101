import 'package:dio/dio.dart';

class DioOptions extends BaseOptions {
  DioOptions({
    super.baseUrl,
  }) : super(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout:    const Duration(seconds: 30),
  );
}
