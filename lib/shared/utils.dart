import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideal/features/products/data_source.dart';
import 'package:ideal/features/settings/models/model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../assets/licenses.dart';
import 'hive.dart';

extension TextX on String {
  Text get text => Text(this);
  Text get textScale2 => Text(this, textScaleFactor: 2);
  Text get textScale4 => Text(this, textScaleFactor: 4);
  Text get textScale6 => Text(this, textScaleFactor: 6);
}

extension PaddingX on Widget {
  Widget get pad => Padding(
        padding: EdgeInsets.all(settingsBloc.padding),
        child: this,
      );
}

String get emptyProductsListInfo =>
    'Currently there are no products available in the list. Kindly try adding some products using the corner button.';

List<MaterialColor> get colors => Colors.primaries;
List<ThemeMode> get themeModes => ThemeMode.values;
// List<AvailableApps> get availableApps => AvailableApps.values;
List<String> get fonts {
  return [
    "Azeret Mono",
    "Comfortaa",
    "DM Mono",
    "Dosis",
    "Fira Sans",
    "IBM Plex Mono",
    "Josefin Sans",
    "Montserrat",
    "Space Mono",
    "Ubuntu",
  ];
}

typedef Font = String;

const uuid = Uuid();
String get randomID => uuid.v1();
const customerIcon = Icon(Icons.people);

const customerLabel = 'CUSTOMERS';
String emptyListInfoCustomer =
    'Currently there are no customers available in the list. Kindly try adding some customers using the corner emoji button.';

late Uint8List defaultImage;
Future<void> get initDefaultImage async {
  ByteData bytes = await rootBundle.load('lib/assets/icon.png');
  defaultImage = bytes.buffer.asUint8List();
}

final DataSource source = MockDataSource();
initializeDependencies() async {
  await RM.storageInitializer(HiveStorage());
  await source.init();
  await initDefaultImage;
  GoogleFonts.config.allowRuntimeFetching = false;
  addLicenses();
}
