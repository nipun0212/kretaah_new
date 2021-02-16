import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kretaa/shop_admin/state/setting_model.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState.data(SettingModel setting) = _Data;
  const factory SettingState.dataLoading(bool loading) = _DataLoading;
  const factory SettingState.error(String error) = _Error;
}
