// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_freezed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopFreezedModel _$_$_ShopFreezedModelFromJson(Map<String, dynamic> json) {
  return _$_ShopFreezedModel(
    documentId: json['documentId'] as String,
    id: json['id'] as int,
    isProcessing: json['isProcessing'] as bool,
    shopName: json['shopName'] as String,
    ownerName: json['ownerName'] as String,
    ownerPhoneNumber: json['ownerPhoneNumber'] as String,
    ownerUID: json['ownerUID'] as String,
    isShopActive: json['isShopActive'] as bool,
    address: json['address'] == null
        ? null
        : AddressFreezedModel.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ShopFreezedModelToJson(
        _$_ShopFreezedModel instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'id': instance.id,
      'isProcessing': instance.isProcessing,
      'shopName': instance.shopName,
      'ownerName': instance.ownerName,
      'ownerPhoneNumber': instance.ownerPhoneNumber,
      'ownerUID': instance.ownerUID,
      'isShopActive': instance.isShopActive,
      'address': instance.address?.toJson(),
    };
