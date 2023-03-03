import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../assets/licenses.dart';
import 'data_source.dart';

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

final source = SharedPreferencesDataSource();
Future<void> initializeDependencies() async {
  await source.init();
  await initDefaultImage;
  // await SharedPreferences.getInstance().then((value) => value.clear());
  GoogleFonts.config.allowRuntimeFetching = false;
  addLicenses();
}
