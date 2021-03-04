import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_freezed_model.freezed.dart';
part 'item_freezed_model.g.dart';

@freezed
abstract class ItemFreezedModel with _$ItemFreezedModel {
  factory ItemFreezedModel({
    String name,
    String description,
    String gst,
    double rate,
    double cgst,
    double sgst,
    double utgst,
    double igst,
    int quantity,
    double rateAfterGST,
    double totalAmount,
    double totalGST,
    String error,
  }) = _ItemFreezedModel;
  factory ItemFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$ItemFreezedModelFromJson(json);
}
