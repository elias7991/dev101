import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

// utilizamos los logs indiscriminadamente por no ser ambiente productivo
class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log(
      'onCreate(bloc: ${bloc.runtimeType})',
      name: 'BlocObserver',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log(
      'onChange(bloc: ${bloc.runtimeType}, change: $change)',
      name: 'BlocObserver',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log(
      'onError(bloc: ${bloc.runtimeType}, error: $error, stackTrace: $stackTrace)',
      name: 'BlocObserver',
    );
  }
}
