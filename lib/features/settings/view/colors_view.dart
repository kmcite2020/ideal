import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/extensions.dart';
import '../../../shared/theme_manager.dart';
import '../models/model.dart';

class ColorsView extends ReactiveStatelessWidget {
  ColorsView({super.key});
  final isShown = false.inj();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Colors".textScale4.pad,
            IconButton(
              onPressed: isShown.toggle,
              icon: Icon(isShown.state ? Icons.arrow_upward : Icons.arrow_downward),
            ).pad
          ],
        ),
        GridView.count(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            for (final eachColor in ThemeManager.colors.take(isShown.state ? 18 : 6))
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: eachColor[100],
                  backgroundColor: eachColor[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeManager.borderRadius),
                  ),
                ),
                onPressed: () {
                  settingsBloc.color = eachColor;
                },
                child: eachColor.colorName.text,
              ).pad,
          ],
        ),
      ],
    );
  }
}
