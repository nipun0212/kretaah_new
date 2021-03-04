import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kretaa/shop_admin/state/item_freezed_model.dart';

part 'bill_freezed_model.freezed.dart';
part 'bill_freezed_model.g.dart';

@freezed
abstract class BillFreezedModel with _$BillFreezedModel {
  factory BillFreezedModel(
      {String? documentId,
      String? description,
      List<ItemFreezedModel>? item,
      int? id,
      int? rewardPointsGiven,
      int? redeemRewardPoints,
      bool? isProcessing,
      String? customerPhoneNumber,
      double? amount,
      String? updatedByUID,
      String? customerUID,
      dynamic updatedOn,
      String? shopDocumentId,
      String? otp,
      String? error}) = _BillFreezedModel;
  factory BillFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$BillFreezedModelFromJson(json);
}
