// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfigData _$ConfigDataFromJson(Map<String, dynamic> json) {
  return _ConfigData.fromJson(json);
}

/// @nodoc
mixin _$ConfigData {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @MaterialColorConverter()
  MaterialColor get color => throw _privateConstructorUsedError;
  String get font => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  double get border => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigDataCopyWith<ConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigDataCopyWith<$Res> {
  factory $ConfigDataCopyWith(
          ConfigData value, $Res Function(ConfigData) then) =
      _$ConfigDataCopyWithImpl<$Res, ConfigData>;
  @useResult
  $Res call(
      {ThemeMode themeMode,
      @MaterialColorConverter() MaterialColor color,
      String font,
      double padding,
      double border});
}

/// @nodoc
class _$ConfigDataCopyWithImpl<$Res, $Val extends ConfigData>
    implements $ConfigDataCopyWith<$Res> {
  _$ConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? color = null,
    Object? font = null,
    Object? padding = null,
    Object? border = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
      font: null == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      border: null == border
          ? _value.border
          : border // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigDataCopyWith<$Res>
    implements $ConfigDataCopyWith<$Res> {
  factory _$$_ConfigDataCopyWith(
          _$_ConfigData value, $Res Function(_$_ConfigData) then) =
      __$$_ConfigDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeMode themeMode,
      @MaterialColorConverter() MaterialColor color,
      String font,
      double padding,
      double border});
}

/// @nodoc
class __$$_ConfigDataCopyWithImpl<$Res>
    extends _$ConfigDataCopyWithImpl<$Res, _$_ConfigData>
    implements _$$_ConfigDataCopyWith<$Res> {
  __$$_ConfigDataCopyWithImpl(
      _$_ConfigData _value, $Res Function(_$_ConfigData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? color = null,
    Object? font = null,
    Object? padding = null,
    Object? border = null,
  }) {
    return _then(_$_ConfigData(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
      font: null == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      border: null == border
          ? _value.border
          : border // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConfigData implements _ConfigData {
  const _$_ConfigData(
      {this.themeMode = ThemeMode.system,
      @MaterialColorConverter() this.color = Colors.blue,
      this.font = 'Dosis',
      this.padding = 8,
      this.border = 8});

  factory _$_ConfigData.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigDataFromJson(json);

  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  @MaterialColorConverter()
  final MaterialColor color;
  @override
  @JsonKey()
  final String font;
  @override
  @JsonKey()
  final double padding;
  @override
  @JsonKey()
  final double border;

  @override
  String toString() {
    return 'ConfigData(themeMode: $themeMode, color: $color, font: $font, padding: $padding, border: $border)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigData &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.font, font) || other.font == font) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.border, border) || other.border == border));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, themeMode, color, font, padding, border);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigDataCopyWith<_$_ConfigData> get copyWith =>
      __$$_ConfigDataCopyWithImpl<_$_ConfigData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigDataToJson(
      this,
    );
  }
}

abstract class _ConfigData implements ConfigData {
  const factory _ConfigData(
      {final ThemeMode themeMode,
      @MaterialColorConverter() final MaterialColor color,
      final String font,
      final double padding,
      final double border}) = _$_ConfigData;

  factory _ConfigData.fromJson(Map<String, dynamic> json) =
      _$_ConfigData.fromJson;

  @override
  ThemeMode get themeMode;
  @override
  @MaterialColorConverter()
  MaterialColor get color;
  @override
  String get font;
  @override
  double get padding;
  @override
  double get border;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigDataCopyWith<_$_ConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}
