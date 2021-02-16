// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingModel _$_$_SettingModelFromJson(Map<String, dynamic> json) {
  return _$_SettingModel(
    reward_percentage: json['reward_percentage'] as int,
    default_gst_setting: json['default_gst_setting'] as String,
    documentId: json['documentId'] as String,
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$_$_SettingModelToJson(_$_SettingModel instance) =>
    <String, dynamic>{
      'reward_percentage': instance.reward_percentage,
      'default_gst_setting': instance.default_gst_setting,
      'documentId': instance.documentId,
      'path': instance.path,
    };
