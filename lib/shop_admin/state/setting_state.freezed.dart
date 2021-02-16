// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingStateTearOff {
  const _$SettingStateTearOff();

// ignore: unused_element
  _Data data(SettingModel setting) {
    return _Data(
      setting,
    );
  }

// ignore: unused_element
  _DataLoading dataLoading(bool loading) {
    return _DataLoading(
      loading,
    );
  }

// ignore: unused_element
  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingState = _$SettingStateTearOff();

/// @nodoc
mixin _$SettingState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(SettingModel setting),
    @required TResult dataLoading(bool loading),
    @required TResult error(String error),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(SettingModel setting),
    TResult dataLoading(bool loading),
    TResult error(String error),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;
}

/// @nodoc
abstract class _$DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  $Res call({SettingModel setting});

  $SettingModelCopyWith<$Res> get setting;
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object setting = freezed,
  }) {
    return _then(_Data(
      setting == freezed ? _value.setting : setting as SettingModel,
    ));
  }

  @override
  $SettingModelCopyWith<$Res> get setting {
    if (_value.setting == null) {
      return null;
    }
    return $SettingModelCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value));
    });
  }
}

/// @nodoc
class _$_Data with DiagnosticableTreeMixin implements _Data {
  const _$_Data(this.setting) : assert(setting != null);

  @override
  final SettingModel setting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingState.data(setting: $setting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingState.data'))
      ..add(DiagnosticsProperty('setting', setting));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Data &&
            (identical(other.setting, setting) ||
                const DeepCollectionEquality().equals(other.setting, setting)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(setting);

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(SettingModel setting),
    @required TResult dataLoading(bool loading),
    @required TResult error(String error),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return data(setting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(SettingModel setting),
    TResult dataLoading(bool loading),
    TResult error(String error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(setting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements SettingState {
  const factory _Data(SettingModel setting) = _$_Data;

  SettingModel get setting;
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith;
}

/// @nodoc
abstract class _$DataLoadingCopyWith<$Res> {
  factory _$DataLoadingCopyWith(
          _DataLoading value, $Res Function(_DataLoading) then) =
      __$DataLoadingCopyWithImpl<$Res>;
  $Res call({bool loading});
}

/// @nodoc
class __$DataLoadingCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$DataLoadingCopyWith<$Res> {
  __$DataLoadingCopyWithImpl(
      _DataLoading _value, $Res Function(_DataLoading) _then)
      : super(_value, (v) => _then(v as _DataLoading));

  @override
  _DataLoading get _value => super._value as _DataLoading;

  @override
  $Res call({
    Object loading = freezed,
  }) {
    return _then(_DataLoading(
      loading == freezed ? _value.loading : loading as bool,
    ));
  }
}

/// @nodoc
class _$_DataLoading with DiagnosticableTreeMixin implements _DataLoading {
  const _$_DataLoading(this.loading) : assert(loading != null);

  @override
  final bool loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingState.dataLoading(loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingState.dataLoading'))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DataLoading &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$DataLoadingCopyWith<_DataLoading> get copyWith =>
      __$DataLoadingCopyWithImpl<_DataLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(SettingModel setting),
    @required TResult dataLoading(bool loading),
    @required TResult error(String error),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return dataLoading(loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(SettingModel setting),
    TResult dataLoading(bool loading),
    TResult error(String error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (dataLoading != null) {
      return dataLoading(loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return dataLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (dataLoading != null) {
      return dataLoading(this);
    }
    return orElse();
  }
}

abstract class _DataLoading implements SettingState {
  const factory _DataLoading(bool loading) = _$_DataLoading;

  bool get loading;
  @JsonKey(ignore: true)
  _$DataLoadingCopyWith<_DataLoading> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(_Error(
      error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
class _$_Error with DiagnosticableTreeMixin implements _Error {
  const _$_Error(this.error) : assert(error != null);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(SettingModel setting),
    @required TResult dataLoading(bool loading),
    @required TResult error(String error),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(SettingModel setting),
    TResult dataLoading(bool loading),
    TResult error(String error),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(_Data value),
    @required TResult dataLoading(_DataLoading value),
    @required TResult error(_Error value),
  }) {
    assert(data != null);
    assert(dataLoading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(_Data value),
    TResult dataLoading(_DataLoading value),
    TResult error(_Error value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SettingState {
  const factory _Error(String error) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith;
}
