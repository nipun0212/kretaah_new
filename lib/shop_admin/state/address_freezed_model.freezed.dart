// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'address_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AddressFreezedModel _$AddressFreezedModelFromJson(Map<String, dynamic> json) {
  return _AddressFreezedModel.fromJson(json);
}

/// @nodoc
class _$AddressFreezedModelTearOff {
  const _$AddressFreezedModelTearOff();

// ignore: unused_element
  _AddressFreezedModel call(
      {String line_1,
      String line_2,
      String line_3,
      String pin_code,
      String error}) {
    return _AddressFreezedModel(
      line_1: line_1,
      line_2: line_2,
      line_3: line_3,
      pin_code: pin_code,
      error: error,
    );
  }

// ignore: unused_element
  AddressFreezedModel fromJson(Map<String, Object> json) {
    return AddressFreezedModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AddressFreezedModel = _$AddressFreezedModelTearOff();

/// @nodoc
mixin _$AddressFreezedModel {
  String get line_1;
  String get line_2;
  String get line_3;
  String get pin_code;
  String get error;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AddressFreezedModelCopyWith<AddressFreezedModel> get copyWith;
}

/// @nodoc
abstract class $AddressFreezedModelCopyWith<$Res> {
  factory $AddressFreezedModelCopyWith(
          AddressFreezedModel value, $Res Function(AddressFreezedModel) then) =
      _$AddressFreezedModelCopyWithImpl<$Res>;
  $Res call(
      {String line_1,
      String line_2,
      String line_3,
      String pin_code,
      String error});
}

/// @nodoc
class _$AddressFreezedModelCopyWithImpl<$Res>
    implements $AddressFreezedModelCopyWith<$Res> {
  _$AddressFreezedModelCopyWithImpl(this._value, this._then);

  final AddressFreezedModel _value;
  // ignore: unused_field
  final $Res Function(AddressFreezedModel) _then;

  @override
  $Res call({
    Object line_1 = freezed,
    Object line_2 = freezed,
    Object line_3 = freezed,
    Object pin_code = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      line_1: line_1 == freezed ? _value.line_1 : line_1 as String,
      line_2: line_2 == freezed ? _value.line_2 : line_2 as String,
      line_3: line_3 == freezed ? _value.line_3 : line_3 as String,
      pin_code: pin_code == freezed ? _value.pin_code : pin_code as String,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
abstract class _$AddressFreezedModelCopyWith<$Res>
    implements $AddressFreezedModelCopyWith<$Res> {
  factory _$AddressFreezedModelCopyWith(_AddressFreezedModel value,
          $Res Function(_AddressFreezedModel) then) =
      __$AddressFreezedModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String line_1,
      String line_2,
      String line_3,
      String pin_code,
      String error});
}

/// @nodoc
class __$AddressFreezedModelCopyWithImpl<$Res>
    extends _$AddressFreezedModelCopyWithImpl<$Res>
    implements _$AddressFreezedModelCopyWith<$Res> {
  __$AddressFreezedModelCopyWithImpl(
      _AddressFreezedModel _value, $Res Function(_AddressFreezedModel) _then)
      : super(_value, (v) => _then(v as _AddressFreezedModel));

  @override
  _AddressFreezedModel get _value => super._value as _AddressFreezedModel;

  @override
  $Res call({
    Object line_1 = freezed,
    Object line_2 = freezed,
    Object line_3 = freezed,
    Object pin_code = freezed,
    Object error = freezed,
  }) {
    return _then(_AddressFreezedModel(
      line_1: line_1 == freezed ? _value.line_1 : line_1 as String,
      line_2: line_2 == freezed ? _value.line_2 : line_2 as String,
      line_3: line_3 == freezed ? _value.line_3 : line_3 as String,
      pin_code: pin_code == freezed ? _value.pin_code : pin_code as String,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AddressFreezedModel
    with DiagnosticableTreeMixin
    implements _AddressFreezedModel {
  _$_AddressFreezedModel(
      {this.line_1, this.line_2, this.line_3, this.pin_code, this.error});

  factory _$_AddressFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFreezedModelFromJson(json);

  @override
  final String line_1;
  @override
  final String line_2;
  @override
  final String line_3;
  @override
  final String pin_code;
  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddressFreezedModel(line_1: $line_1, line_2: $line_2, line_3: $line_3, pin_code: $pin_code, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddressFreezedModel'))
      ..add(DiagnosticsProperty('line_1', line_1))
      ..add(DiagnosticsProperty('line_2', line_2))
      ..add(DiagnosticsProperty('line_3', line_3))
      ..add(DiagnosticsProperty('pin_code', pin_code))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddressFreezedModel &&
            (identical(other.line_1, line_1) ||
                const DeepCollectionEquality().equals(other.line_1, line_1)) &&
            (identical(other.line_2, line_2) ||
                const DeepCollectionEquality().equals(other.line_2, line_2)) &&
            (identical(other.line_3, line_3) ||
                const DeepCollectionEquality().equals(other.line_3, line_3)) &&
            (identical(other.pin_code, pin_code) ||
                const DeepCollectionEquality()
                    .equals(other.pin_code, pin_code)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(line_1) ^
      const DeepCollectionEquality().hash(line_2) ^
      const DeepCollectionEquality().hash(line_3) ^
      const DeepCollectionEquality().hash(pin_code) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$AddressFreezedModelCopyWith<_AddressFreezedModel> get copyWith =>
      __$AddressFreezedModelCopyWithImpl<_AddressFreezedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressFreezedModelToJson(this);
  }
}

abstract class _AddressFreezedModel implements AddressFreezedModel {
  factory _AddressFreezedModel(
      {String line_1,
      String line_2,
      String line_3,
      String pin_code,
      String error}) = _$_AddressFreezedModel;

  factory _AddressFreezedModel.fromJson(Map<String, dynamic> json) =
      _$_AddressFreezedModel.fromJson;

  @override
  String get line_1;
  @override
  String get line_2;
  @override
  String get line_3;
  @override
  String get pin_code;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$AddressFreezedModelCopyWith<_AddressFreezedModel> get copyWith;
}
