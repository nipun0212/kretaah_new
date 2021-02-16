// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_freezed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillFreezedModel _$_$_BillFreezedModelFromJson(Map<String, dynamic> json) {
  return _$_BillFreezedModel(
    documentId: json['documentId'] as String,
    description: json['description'] as String,
    item: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : ItemFreezedModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    rewardPointsGiven: json['rewardPointsGiven'] as int,
    redeemRewardPoints: json['redeemRewardPoints'] as int,
    isProcessing: json['isProcessing'] as bool,
    customerPhoneNumber: json['customerPhoneNumber'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    updatedByUID: json['updatedByUID'] as String,
    customerUID: json['customerUID'] as String,
    updatedOn: json['updatedOn'],
    shopDocumentId: json['shopDocumentId'] as String,
    otp: json['otp'] as String,
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$_$_BillFreezedModelToJson(
        _$_BillFreezedModel instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'description': instance.description,
      'item': instance.item,
      'id': instance.id,
      'rewardPointsGiven': instance.rewardPointsGiven,
      'redeemRewardPoints': instance.redeemRewardPoints,
      'isProcessing': instance.isProcessing,
      'customerPhoneNumber': instance.customerPhoneNumber,
      'amount': instance.amount,
      'updatedByUID': instance.updatedByUID,
      'customerUID': instance.customerUID,
      'updatedOn': instance.updatedOn,
      'shopDocumentId': instance.shopDocumentId,
      'otp': instance.otp,
      'error': instance.error,
    };
