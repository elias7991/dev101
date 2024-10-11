import 'package:dev101/features/features.dart';
import 'package:go_router/go_router.dart';

final todoManagementRoutes = <RouteBase>[
  GoRoute(
    path: HomeScreen.routePath,
    name: HomeScreen.routeName,
    builder: (context, state) => const HomeScreen(),
    routes: <RouteBase>[
      GoRoute(
        path: TaskScreen.routePath,
        name: TaskScreen.routeName,
        builder: (context, GoRouterState state) {
          final Map<String, dynamic>? extra =
              state.extra as Map<String, dynamic>?;

          final task = extra?['task'] as TaskEntity?;

          return TaskScreen(
            task: task,
          );
        },
      ),
    ],
  ),
];
