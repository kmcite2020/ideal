// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [BackButton()],
      ),
      body: ListView(
        children: [
          Text(settingsBloc.interface.toString(), textScaleFactor: 5),
        ],
      ),
    );
  }
}
