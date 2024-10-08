import 'dart:async';

import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // ensure all initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(await builder());
}
