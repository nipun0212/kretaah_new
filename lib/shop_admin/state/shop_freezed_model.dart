import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kretaa/shop_admin/state/address_freezed_model.dart';

part 'shop_freezed_model.freezed.dart';
part 'shop_freezed_model.g.dart';

@freezed
abstract class ShopFreezedModel with _$ShopFreezedModel {
  @JsonSerializable(explicitToJson: true)
  factory ShopFreezedModel(
      {String? documentId,
      int? id,
      bool? isProcessing,
      String? shopName,
      String? ownerName,
      String? ownerPhoneNumber,
      String? ownerUID,
      bool? isShopActive,
      AddressFreezedModel? address}) = _ShopFreezedModel;
  factory ShopFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$ShopFreezedModelFromJson(json);
}
