import 'package:flutter/material.dart';
import 'package:ideal/shared/utils.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../models/model.dart';

class FontsView extends ReactiveStatelessWidget {
  FontsView({super.key});
  final isShown = false.inj();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Fonts".textScale4.pad,
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
            for (final Font font in fonts.take(isShown.state ? 9 : 3))
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: settingsBloc.color[100],
                  backgroundColor: settingsBloc.color[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  settingsBloc.font = font;
                },
                child: font.text,
              ).pad,
          ],
        ),
      ],
    );
  }
}
