import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'address_freezed_model.freezed.dart';
part 'address_freezed_model.g.dart';

@freezed
abstract class AddressFreezedModel with _$AddressFreezedModel {
  factory AddressFreezedModel({
    String line_1,
    String line_2,
    String line_3,
    String pin_code,
    String error,
  }) = _AddressFreezedModel;
  factory AddressFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$AddressFreezedModelFromJson(json);
}
