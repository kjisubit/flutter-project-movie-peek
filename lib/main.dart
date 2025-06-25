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

  runApp(MyApp());
}

final GoRouter _router = GoRouter(routes: goRoutes);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _setStatusBarStyle(context);
    return MaterialApp.router(
      routerConfig: _router,
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
