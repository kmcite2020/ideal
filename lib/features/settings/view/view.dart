// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:ideal/shared/utils.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

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
          ColorsView(),
        ],
      ),
    );
  }
}

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
            "Colors".scale4.pad,
            IconButton(
              onPressed: isShown.toggle,
              icon: Icon(
                isShown.state ? Icons.arrow_upward : Icons.arrow_downward,
              ),
            ).pad
          ],
        ),
        GridView.count(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            for (final eachColor in colors.take(isShown.state ? 18 : 6))
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: eachColor[100],
                  backgroundColor: eachColor[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: eachColor.colorName.text,
              ).pad
          ],
        ),
      ],
    );
  }
}
