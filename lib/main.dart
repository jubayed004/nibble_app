import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/share/controller/language_controller.dart';

import 'core/router/routes.dart';
import 'core/theme/light_theme.dart';
import 'helper/device_utils/device_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();

  // await LanguageController.getLanguages();

  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,

        //Route Section
        routeInformationParser: AppRouter.route.routeInformationParser,
        routerDelegate: AppRouter.route.routerDelegate,
        routeInformationProvider: AppRouter.route.routeInformationProvider,

        //Theme Section
        themeMode: ThemeMode.light,
        theme: lightTheme,
        /* darkTheme: darkTheme,*/
      ),
    );
  }
}
