import 'package:dartz/dartz.dart';
import 'package:dev101/core/network/errors/errors.dart';
import 'package:dio/dio.dart';

typedef LR<T> = Either<ErrorHandler, T>;

class DioClient {
  const DioClient(this.dio);

  final Dio dio;

  //TODO: agregar los demás verbos según necesidad
  Future<LR<T>> get<T>(
    String path, {
    T Function(Map<String, dynamic>)? fromJson,
    T Function(List<dynamic>)? fromList,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? aditionalHeaders,
  }) async {
    final options = Options(
      headers: aditionalHeaders,
    );

    try {
      final response = await dio.get(
        path,
        options: options,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        if (fromJson != null) {
          return right(fromJson(response.data));
        } else if (fromList != null) {
          return right(fromList(response.data));
        } else {
          throw ArgumentError(
              'At least one of the parameters fromJson and fromJsonList must be sent');
        }
      } else {
        return left(ErrorHandler(
          msg: response.statusMessage ?? 'Error controlable.',
          code: response.statusCode.toString(),
          type: ErrorTypes.warning,
        ));
      }
    } catch (exception) {
      return left(
        ErrorHandler.exception(
          exception: exception,
        ),
      );
    }
  }
}
