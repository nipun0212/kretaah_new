// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_freezed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemFreezedModel _$_$_ItemFreezedModelFromJson(Map<String, dynamic> json) {
  return _$_ItemFreezedModel(
    name: json['name'] as String,
    description: json['description'] as String,
    gst: json['gst'] as String,
    rate: (json['rate'] as num)?.toDouble(),
    cgst: (json['cgst'] as num)?.toDouble(),
    sgst: (json['sgst'] as num)?.toDouble(),
    utgst: (json['utgst'] as num)?.toDouble(),
    igst: (json['igst'] as num)?.toDouble(),
    quantity: json['quantity'] as int,
    rateAfterGST: (json['rateAfterGST'] as num)?.toDouble(),
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    totalGST: (json['totalGST'] as num)?.toDouble(),
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$_$_ItemFreezedModelToJson(
        _$_ItemFreezedModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'gst': instance.gst,
      'rate': instance.rate,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'utgst': instance.utgst,
      'igst': instance.igst,
      'quantity': instance.quantity,
      'rateAfterGST': instance.rateAfterGST,
      'totalAmount': instance.totalAmount,
      'totalGST': instance.totalGST,
      'error': instance.error,
    };
