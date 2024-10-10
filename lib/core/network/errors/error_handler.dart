import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

enum ErrorTypes { network, critical, warning }

class ErrorHandler extends Equatable {
  static const defaultErrorMsg = 'Ha ocurrido un error inesperado.';
  static const defaultErrorCode = '500';

  const ErrorHandler({
    this.msg = defaultErrorMsg,
    this.type = ErrorTypes.critical,
    this.code = defaultErrorCode,
  });

  //debería poder hacerse mas limpio
  factory ErrorHandler.exception({
    required dynamic exception,
  }) {
    switch (exception.runtimeType) {
      case const (DioException):
        switch ((exception as DioException).type) {
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.unknown:
          case DioExceptionType.connectionError:
          case DioExceptionType.cancel:
          case DioExceptionType.badResponse:
            switch (exception.response?.statusCode) {
              case 400:
                const badRequestMsg =
                    'El servidor no ha podido interpretar la solicitud.';
                return const ErrorHandler(
                  msg: badRequestMsg,
                  type: ErrorTypes.warning,
                  code: '400',
                );

              case 404:
                const notFoundMsg =
                    'El servidor no ha podido encontrar el contenido solicitado.';
                return const ErrorHandler(
                  msg: notFoundMsg,
                  type: ErrorTypes.warning,
                  code: '404',
                );

              case 405:
                const noAllowedMsg =
                    'El servidor ha deshabilitado esta solicitud.';
                return const ErrorHandler(
                  msg: noAllowedMsg,
                  type: ErrorTypes.warning,
                  code: '405',
                );

              default:
                return const ErrorHandler();
            }

          default:
            return ErrorHandler(
              msg: exception.toString(),
            );
        }
      default:
        return const ErrorHandler();
    }
  }

  final String msg;
  final ErrorTypes type;
  final String code;

  @override
  List<Object?> get props => [msg, type, code];
}
