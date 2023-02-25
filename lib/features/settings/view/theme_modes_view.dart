import 'package:flutter/material.dart';
import 'package:ideal/features/settings/models/model.dart';
import 'package:ideal/shared/utils.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ThemeModesView extends ReactiveStatelessWidget {
  const ThemeModesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Modes'.textScale4.pad,
        for (final ThemeMode eachMode in themeModes)
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
            selected: settingsBloc.themeMode == eachMode,
          )
      ],
    );
  }
}
