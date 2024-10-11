import 'package:dev101/core/services/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerServices({
  required SharedPreferences prefs,
}) async {
  GetIt.I.registerSingleton<SharedPreferencesService>(
    SharedPreferencesService(prefs: prefs),
  );
}
