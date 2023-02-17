import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'shared/i18n/i18n.dart';
import 'shared/router.dart';
import 'shared/utils.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends TopStatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData.dark(useMaterial3: true),
      locale: i18n.locale,
      localeResolutionCallback: i18n.localeResolutionCallback,
      localizationsDelegates: i18n.localizationsDelegates,
      supportedLocales: i18n.supportedLocales,
    );
  }
}
