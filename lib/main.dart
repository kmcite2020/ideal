import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'features/dashboard/dashboard.dart';
import 'shared/i18n/i18n.dart';
import 'shared/theme_manager.dart';
import 'shared/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends ReactiveStatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RM.navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.theme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeManager.themeMode,
      locale: i18n.locale,
      localeResolutionCallback: i18n.localeResolutionCallback,
      localizationsDelegates: i18n.localizationsDelegates,
      supportedLocales: i18n.supportedLocales,
      home: DashboardView(),
    );
  }
}
