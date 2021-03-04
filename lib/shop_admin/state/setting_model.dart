import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@freezed
abstract class SettingModel with _$SettingModel {
  factory SettingModel(
      {int? reward_percentage,
      String? default_gst_setting,
      String? documentId,
      String? path}) = _SettingModel;
  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}
