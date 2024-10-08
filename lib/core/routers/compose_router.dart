import 'package:dev101/core/routers/todo_management_router.dart';
import 'package:dev101/features/todo_management/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: HomeScreen.routePath,
  debugLogDiagnostics: true,
  routes: [
    ...todoManagementRoutes,
  ],
);
