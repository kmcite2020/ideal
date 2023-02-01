import 'package:flutter/material.dart';

import 'shared/navigator.dart';
import 'shared/utils.dart';

void main() async {
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: navigator.routeInformationParser,
      routerDelegate: navigator.routerDelegate,
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
