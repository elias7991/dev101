import 'dart:async';

import 'package:dev101/core/core.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // ensure all initialized
  WidgetsFlutterBinding.ensureInitialized();

  // init project dependencies
  await setUpDependencies();

  runApp(await builder());
}
