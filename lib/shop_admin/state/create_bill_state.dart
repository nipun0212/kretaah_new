import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kretaa/shop_admin/state/create_item_state.dart';
import 'package:flutter/foundation.dart';

part 'create_bill_state.freezed.dart';
// part 'create_bill_state.g.dart';

@freezed
abstract class CreateBillState with _$CreateBillState {
  // const factory CreateBillState.noError() = _NoError;
  // const factory CreateBillState.error(String errorText) = _Error;
  // const factory CreateBillState.loading() = _Loading;
  const factory CreateBillState({
    String? documentId,
    String? description,
    List<CreateItemState>? item,
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
    String? error,
  }) = _Bill;

  // factory CreateBillState.fromJson(Map<String, dynamic> json) =>
  //     _$CreateBillStateFromJson(json);
}
