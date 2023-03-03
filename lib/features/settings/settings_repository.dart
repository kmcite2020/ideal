// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models/model.dart';

abstract class SettingsInterface {
  ConfigData get configData;
  set configData(ConfigData data);
}

class SettingsRepository implements SettingsInterface {
  final SharedPreferencesDataSource dataSource;
  SettingsRepository({
    required this.dataSource,
  });
  @override
  ConfigData get configData {
    return ConfigData.fromJson(dataSource.load('configData'));
  }

  @override
  set configData(ConfigData data) {
    dataSource.save('configData', data.toJson());
  }
}
