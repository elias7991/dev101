import 'package:dev101/core/providers/providers.dart';
import 'package:dev101/core/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GlobalLoaderOverlay(
          overlayColor: Colors.black.withOpacity(0.5),
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.bounceOut,
          overlayWidgetBuilder: (progress) => const Center(
            child: CircularProgressIndicator(),
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Todo app',
            routerConfig: routerConfig,
          ),
        ),
      ),
    );
  }
}
