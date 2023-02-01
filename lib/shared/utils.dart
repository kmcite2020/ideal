import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../assets/licenses.dart';
import 'hive.dart';

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

// String googleFont(String font) {}

/// UTILS
// String getGoogleFont(x) {
//   return GoogleFonts.getFont(x).fontFamily!;
// }

String get randomID => const Uuid().v1();
const customerIcon = Icon(Icons.people);

const customerLabel = 'CUSTOMERS';
String emptyListInfoCustomer =
    'Currently there are no customers available in the list. Kindly try adding some customers using the corner emoji button.';

late Uint8List defaultImage;
Future<void> get initDefaultImage async {
  ByteData bytes = await rootBundle.load('lib/assets/icon.png');
  defaultImage = bytes.buffer.asUint8List();
}

setup() async {
  await RM.storageInitializer(HiveStorage());
  await initDefaultImage;
  GoogleFonts.config.allowRuntimeFetching = false;
  addLicenses();
}