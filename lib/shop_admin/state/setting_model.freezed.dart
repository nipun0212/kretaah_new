// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
class _$SettingModelTearOff {
  const _$SettingModelTearOff();

// ignore: unused_element
  _SettingModel call(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path}) {
    return _SettingModel(
      reward_percentage: reward_percentage,
      default_gst_setting: default_gst_setting,
      documentId: documentId,
      path: path,
    );
  }

// ignore: unused_element
  SettingModel fromJson(Map<String, Object> json) {
    return SettingModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SettingModel = _$SettingModelTearOff();

/// @nodoc
mixin _$SettingModel {
  int get reward_percentage;
  String get default_gst_setting;
  String get documentId;
  String get path;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res>;
  $Res call(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res> implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  final SettingModel _value;
  // ignore: unused_field
  final $Res Function(SettingModel) _then;

  @override
  $Res call({
    Object reward_percentage = freezed,
    Object default_gst_setting = freezed,
    Object documentId = freezed,
    Object path = freezed,
  }) {
    return _then(_value.copyWith(
      reward_percentage: reward_percentage == freezed
          ? _value.reward_percentage
          : reward_percentage as int,
      default_gst_setting: default_gst_setting == freezed
          ? _value.default_gst_setting
          : default_gst_setting as String,
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      path: path == freezed ? _value.path : path as String,
    ));
  }
}

/// @nodoc
abstract class _$SettingModelCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$SettingModelCopyWith(
          _SettingModel value, $Res Function(_SettingModel) then) =
      __$SettingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path});
}

/// @nodoc
class __$SettingModelCopyWithImpl<$Res> extends _$SettingModelCopyWithImpl<$Res>
    implements _$SettingModelCopyWith<$Res> {
  __$SettingModelCopyWithImpl(
      _SettingModel _value, $Res Function(_SettingModel) _then)
      : super(_value, (v) => _then(v as _SettingModel));

  @override
  _SettingModel get _value => super._value as _SettingModel;

  @override
  $Res call({
    Object reward_percentage = freezed,
    Object default_gst_setting = freezed,
    Object documentId = freezed,
    Object path = freezed,
  }) {
    return _then(_SettingModel(
      reward_percentage: reward_percentage == freezed
          ? _value.reward_percentage
          : reward_percentage as int,
      default_gst_setting: default_gst_setting == freezed
          ? _value.default_gst_setting
          : default_gst_setting as String,
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      path: path == freezed ? _value.path : path as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SettingModel with DiagnosticableTreeMixin implements _SettingModel {
  _$_SettingModel(
      {this.reward_percentage,
      this.default_gst_setting,
      this.documentId,
      this.path});

  factory _$_SettingModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingModelFromJson(json);

  @override
  final int reward_percentage;
  @override
  final String default_gst_setting;
  @override
  final String documentId;
  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingModel(reward_percentage: $reward_percentage, default_gst_setting: $default_gst_setting, documentId: $documentId, path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingModel'))
      ..add(DiagnosticsProperty('reward_percentage', reward_percentage))
      ..add(DiagnosticsProperty('default_gst_setting', default_gst_setting))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingModel &&
            (identical(other.reward_percentage, reward_percentage) ||
                const DeepCollectionEquality()
                    .equals(other.reward_percentage, reward_percentage)) &&
            (identical(other.default_gst_setting, default_gst_setting) ||
                const DeepCollectionEquality()
                    .equals(other.default_gst_setting, default_gst_setting)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reward_percentage) ^
      const DeepCollectionEquality().hash(default_gst_setting) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  _$SettingModelCopyWith<_SettingModel> get copyWith =>
      __$SettingModelCopyWithImpl<_SettingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingModelToJson(this);
  }
}

abstract class _SettingModel implements SettingModel {
  factory _SettingModel(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path}) = _$_SettingModel;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$_SettingModel.fromJson;

  @override
  int get reward_percentage;
  @override
  String get default_gst_setting;
  @override
  String get documentId;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$SettingModelCopyWith<_SettingModel> get copyWith;
}
