import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/extensions.dart';
import '../../../shared/theme_manager.dart';
import '../models/model.dart';

class ThemeModesView extends ReactiveStatelessWidget {
  const ThemeModesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Modes'.textScale4.pad,
        for (final ThemeMode eachMode in ThemeManager.themeModes)
          ListTile(
            onTap: () {
              settingsBloc.themeMode = eachMode;
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (eachMode.index.toString() + '. ' + eachMode.name).textScale2,
                Icon(
                  settingsBloc.themeMode == eachMode ? Icons.done : Icons.cancel,
                  color: settingsBloc.themeMode == eachMode ? Colors.green : Colors.red,
                )
              ],
            ),
            selected: isThemeModeSelected(eachMode),
          )
      ],
    );
  }
}

bool isThemeModeSelected(ThemeMode eachMode) => settingsBloc.themeMode == eachMode;
