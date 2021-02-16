// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'gst_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GSTState _$GSTStateFromJson(Map<String, dynamic> json) {
  return _Gst.fromJson(json);
}

/// @nodoc
class _$GSTStateTearOff {
  const _$GSTStateTearOff();

// ignore: unused_element
  _Gst call({String name, int percentage}) {
    return _Gst(
      name: name,
      percentage: percentage,
    );
  }

// ignore: unused_element
  GSTState fromJson(Map<String, Object> json) {
    return GSTState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GSTState = _$GSTStateTearOff();

/// @nodoc
mixin _$GSTState {
  String get name;
  int get percentage;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GSTStateCopyWith<GSTState> get copyWith;
}

/// @nodoc
abstract class $GSTStateCopyWith<$Res> {
  factory $GSTStateCopyWith(GSTState value, $Res Function(GSTState) then) =
      _$GSTStateCopyWithImpl<$Res>;
  $Res call({String name, int percentage});
}

/// @nodoc
class _$GSTStateCopyWithImpl<$Res> implements $GSTStateCopyWith<$Res> {
  _$GSTStateCopyWithImpl(this._value, this._then);

  final GSTState _value;
  // ignore: unused_field
  final $Res Function(GSTState) _then;

  @override
  $Res call({
    Object name = freezed,
    Object percentage = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      percentage: percentage == freezed ? _value.percentage : percentage as int,
    ));
  }
}

/// @nodoc
abstract class _$GstCopyWith<$Res> implements $GSTStateCopyWith<$Res> {
  factory _$GstCopyWith(_Gst value, $Res Function(_Gst) then) =
      __$GstCopyWithImpl<$Res>;
  @override
  $Res call({String name, int percentage});
}

/// @nodoc
class __$GstCopyWithImpl<$Res> extends _$GSTStateCopyWithImpl<$Res>
    implements _$GstCopyWith<$Res> {
  __$GstCopyWithImpl(_Gst _value, $Res Function(_Gst) _then)
      : super(_value, (v) => _then(v as _Gst));

  @override
  _Gst get _value => super._value as _Gst;

  @override
  $Res call({
    Object name = freezed,
    Object percentage = freezed,
  }) {
    return _then(_Gst(
      name: name == freezed ? _value.name : name as String,
      percentage: percentage == freezed ? _value.percentage : percentage as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Gst implements _Gst {
  _$_Gst({this.name, this.percentage});

  factory _$_Gst.fromJson(Map<String, dynamic> json) => _$_$_GstFromJson(json);

  @override
  final String name;
  @override
  final int percentage;

  @override
  String toString() {
    return 'GSTState(name: $name, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gst &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.percentage, percentage) ||
                const DeepCollectionEquality()
                    .equals(other.percentage, percentage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(percentage);

  @JsonKey(ignore: true)
  @override
  _$GstCopyWith<_Gst> get copyWith =>
      __$GstCopyWithImpl<_Gst>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GstToJson(this);
  }
}

abstract class _Gst implements GSTState {
  factory _Gst({String name, int percentage}) = _$_Gst;

  factory _Gst.fromJson(Map<String, dynamic> json) = _$_Gst.fromJson;

  @override
  String get name;
  @override
  int get percentage;
  @override
  @JsonKey(ignore: true)
  _$GstCopyWith<_Gst> get copyWith;
}
