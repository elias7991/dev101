import 'package:dev101/features/features.dart';
import 'package:go_router/go_router.dart';

final todoManagementRoutes = <RouteBase>[
  GoRoute(
    path: HomeScreen.routePath,
    name: HomeScreen.routeName,
    builder: (context, state) => const HomeScreen(),
  ),
];
