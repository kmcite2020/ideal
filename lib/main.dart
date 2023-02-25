import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideal/features/settings/models/model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'shared/i18n/i18n.dart';
import 'shared/router.dart';
import 'shared/utils.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends ReactiveStatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: settingsBloc.color,
        scaffoldBackgroundColor: settingsBloc.color[100],
        useMaterial3: true,
        fontFamily: GoogleFonts.getFont(settingsBloc.font).fontFamily,
        appBarTheme: AppBarTheme(
          color: settingsBloc.color[200],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: settingsBloc.color[800],
              backgroundColor: settingsBloc.color[200],
              minimumSize: Size.fromHeight(
                80,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(settingsBloc.borderRadius),
              )),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: settingsBloc.color,
        scaffoldBackgroundColor: settingsBloc.color[900],
        useMaterial3: true,
        fontFamily: GoogleFonts.getFont(settingsBloc.font).fontFamily,
        appBarTheme: AppBarTheme(
          color: settingsBloc.color[800],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: settingsBloc.color[200],
              backgroundColor: settingsBloc.color[800],
              minimumSize: Size.fromHeight(
                80,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(settingsBloc.borderRadius),
              )),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
      themeMode: settingsBloc.themeMode,
      locale: i18n.locale,
      localeResolutionCallback: i18n.localeResolutionCallback,
      localizationsDelegates: i18n.localizationsDelegates,
      supportedLocales: i18n.supportedLocales,
    );
  }
}
