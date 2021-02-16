// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RewardPointState _$RewardPointStateFromJson(Map<String, dynamic> json) {
  return _RewardPointState.fromJson(json);
}

/// @nodoc
class _$RewardPointStateTearOff {
  const _$RewardPointStateTearOff();

// ignore: unused_element
  _RewardPointState call(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path}) {
    return _RewardPointState(
      reward_percentage: reward_percentage,
      default_gst_setting: default_gst_setting,
      documentId: documentId,
      path: path,
    );
  }

// ignore: unused_element
  RewardPointState fromJson(Map<String, Object> json) {
    return RewardPointState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RewardPointState = _$RewardPointStateTearOff();

/// @nodoc
mixin _$RewardPointState {
  int get reward_percentage;
  String get default_gst_setting;
  String get documentId;
  String get path;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RewardPointStateCopyWith<RewardPointState> get copyWith;
}

/// @nodoc
abstract class $RewardPointStateCopyWith<$Res> {
  factory $RewardPointStateCopyWith(
          RewardPointState value, $Res Function(RewardPointState) then) =
      _$RewardPointStateCopyWithImpl<$Res>;
  $Res call(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path});
}

/// @nodoc
class _$RewardPointStateCopyWithImpl<$Res>
    implements $RewardPointStateCopyWith<$Res> {
  _$RewardPointStateCopyWithImpl(this._value, this._then);

  final RewardPointState _value;
  // ignore: unused_field
  final $Res Function(RewardPointState) _then;

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
abstract class _$RewardPointStateCopyWith<$Res>
    implements $RewardPointStateCopyWith<$Res> {
  factory _$RewardPointStateCopyWith(
          _RewardPointState value, $Res Function(_RewardPointState) then) =
      __$RewardPointStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path});
}

/// @nodoc
class __$RewardPointStateCopyWithImpl<$Res>
    extends _$RewardPointStateCopyWithImpl<$Res>
    implements _$RewardPointStateCopyWith<$Res> {
  __$RewardPointStateCopyWithImpl(
      _RewardPointState _value, $Res Function(_RewardPointState) _then)
      : super(_value, (v) => _then(v as _RewardPointState));

  @override
  _RewardPointState get _value => super._value as _RewardPointState;

  @override
  $Res call({
    Object reward_percentage = freezed,
    Object default_gst_setting = freezed,
    Object documentId = freezed,
    Object path = freezed,
  }) {
    return _then(_RewardPointState(
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
class _$_RewardPointState
    with DiagnosticableTreeMixin
    implements _RewardPointState {
  _$_RewardPointState(
      {this.reward_percentage,
      this.default_gst_setting,
      this.documentId,
      this.path});

  factory _$_RewardPointState.fromJson(Map<String, dynamic> json) =>
      _$_$_RewardPointStateFromJson(json);

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
    return 'RewardPointState(reward_percentage: $reward_percentage, default_gst_setting: $default_gst_setting, documentId: $documentId, path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RewardPointState'))
      ..add(DiagnosticsProperty('reward_percentage', reward_percentage))
      ..add(DiagnosticsProperty('default_gst_setting', default_gst_setting))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RewardPointState &&
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
  _$RewardPointStateCopyWith<_RewardPointState> get copyWith =>
      __$RewardPointStateCopyWithImpl<_RewardPointState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RewardPointStateToJson(this);
  }
}

abstract class _RewardPointState implements RewardPointState {
  factory _RewardPointState(
      {int reward_percentage,
      String default_gst_setting,
      String documentId,
      String path}) = _$_RewardPointState;

  factory _RewardPointState.fromJson(Map<String, dynamic> json) =
      _$_RewardPointState.fromJson;

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
  _$RewardPointStateCopyWith<_RewardPointState> get copyWith;
}
