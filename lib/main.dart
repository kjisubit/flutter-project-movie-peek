import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_peek/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_peek/routes/app_routes.dart';
import 'package:movie_peek/theme/app_theme.dart';
import 'package:movie_peek/utils/locale_manager.dart';

import 'injector.dart';

Future<void> main() async {
  await initInjector();
  await dotenv.load(fileName: ".env");
  final deviceLocale = PlatformDispatcher.instance.locale;
  LocaleManager().initialize(deviceLocale);

  // Integration Test 수행 직전 라우터 초기화 작업을 위해 main() 내부에서 생성
  final router = GoRouter(routes: goRoutes);

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    _setStatusBarStyle(context);
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ko')],
    );
  }
}

void _setStatusBarStyle(BuildContext context) {
  final isDarkMode =
      MediaQuery.of(context).platformBrightness == Brightness.dark;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? Colors.black : Colors.white,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    ),
  );
}
