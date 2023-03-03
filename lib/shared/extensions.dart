import 'package:flutter/material.dart';
import 'package:ideal/shared/theme_manager.dart';

import '../features/settings/models/model.dart';

extension TextX on Object {
  Text get text => Text(this.toString());
  Text get textScale2 => Text(this.toString(), textScaleFactor: 2);
  Text get textScale4 => Text(this.toString(), textScaleFactor: 4);
  Text get textScale6 => Text(this.toString(), textScaleFactor: 6);
}

extension PaddingX on Widget {
  Widget get pad => Padding(
        padding: EdgeInsets.all(settingsBloc.padding),
        child: this,
      );
  Widget get pad4 => Padding(
        padding: EdgeInsets.all(4),
        child: this,
      );
  Widget get pad12 => Padding(
        padding: EdgeInsets.all(12),
        child: this,
      );
}

extension ClipRRectX on Widget {
  Widget get clipRadius => ClipRRect(
        borderRadius: BorderRadius.circular(ThemeManager.borderRadius),
        child: this,
      );
}

typedef Font = String;
