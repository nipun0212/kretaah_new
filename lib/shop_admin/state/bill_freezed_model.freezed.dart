// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bill_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BillFreezedModel _$BillFreezedModelFromJson(Map<String, dynamic> json) {
  return _BillFreezedModel.fromJson(json);
}

/// @nodoc
class _$BillFreezedModelTearOff {
  const _$BillFreezedModelTearOff();

// ignore: unused_element
  _BillFreezedModel call(
      {String documentId,
      String description,
      List<ItemFreezedModel> item,
      int id,
      int rewardPointsGiven,
      int redeemRewardPoints,
      bool isProcessing,
      String customerPhoneNumber,
      double amount,
      String updatedByUID,
      String customerUID,
      dynamic updatedOn,
      String shopDocumentId,
      String otp,
      String error}) {
    return _BillFreezedModel(
      documentId: documentId,
      description: description,
      item: item,
      id: id,
      rewardPointsGiven: rewardPointsGiven,
      redeemRewardPoints: redeemRewardPoints,
      isProcessing: isProcessing,
      customerPhoneNumber: customerPhoneNumber,
      amount: amount,
      updatedByUID: updatedByUID,
      customerUID: customerUID,
      updatedOn: updatedOn,
      shopDocumentId: shopDocumentId,
      otp: otp,
      error: error,
    );
  }

// ignore: unused_element
  BillFreezedModel fromJson(Map<String, Object> json) {
    return BillFreezedModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BillFreezedModel = _$BillFreezedModelTearOff();

/// @nodoc
mixin _$BillFreezedModel {
  String get documentId;
  String get description;
  List<ItemFreezedModel> get item;
  int get id;
  int get rewardPointsGiven;
  int get redeemRewardPoints;
  bool get isProcessing;
  String get customerPhoneNumber;
  double get amount;
  String get updatedByUID;
  String get customerUID;
  dynamic get updatedOn;
  String get shopDocumentId;
  String get otp;
  String get error;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $BillFreezedModelCopyWith<BillFreezedModel> get copyWith;
}

/// @nodoc
abstract class $BillFreezedModelCopyWith<$Res> {
  factory $BillFreezedModelCopyWith(
          BillFreezedModel value, $Res Function(BillFreezedModel) then) =
      _$BillFreezedModelCopyWithImpl<$Res>;
  $Res call(
      {String documentId,
      String description,
      List<ItemFreezedModel> item,
      int id,
      int rewardPointsGiven,
      int redeemRewardPoints,
      bool isProcessing,
      String customerPhoneNumber,
      double amount,
      String updatedByUID,
      String customerUID,
      dynamic updatedOn,
      String shopDocumentId,
      String otp,
      String error});
}

/// @nodoc
class _$BillFreezedModelCopyWithImpl<$Res>
    implements $BillFreezedModelCopyWith<$Res> {
  _$BillFreezedModelCopyWithImpl(this._value, this._then);

  final BillFreezedModel _value;
  // ignore: unused_field
  final $Res Function(BillFreezedModel) _then;

  @override
  $Res call({
    Object documentId = freezed,
    Object description = freezed,
    Object item = freezed,
    Object id = freezed,
    Object rewardPointsGiven = freezed,
    Object redeemRewardPoints = freezed,
    Object isProcessing = freezed,
    Object customerPhoneNumber = freezed,
    Object amount = freezed,
    Object updatedByUID = freezed,
    Object customerUID = freezed,
    Object updatedOn = freezed,
    Object shopDocumentId = freezed,
    Object otp = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      description:
          description == freezed ? _value.description : description as String,
      item: item == freezed ? _value.item : item as List<ItemFreezedModel>,
      id: id == freezed ? _value.id : id as int,
      rewardPointsGiven: rewardPointsGiven == freezed
          ? _value.rewardPointsGiven
          : rewardPointsGiven as int,
      redeemRewardPoints: redeemRewardPoints == freezed
          ? _value.redeemRewardPoints
          : redeemRewardPoints as int,
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      customerPhoneNumber: customerPhoneNumber == freezed
          ? _value.customerPhoneNumber
          : customerPhoneNumber as String,
      amount: amount == freezed ? _value.amount : amount as double,
      updatedByUID: updatedByUID == freezed
          ? _value.updatedByUID
          : updatedByUID as String,
      customerUID:
          customerUID == freezed ? _value.customerUID : customerUID as String,
      updatedOn: updatedOn == freezed ? _value.updatedOn : updatedOn as dynamic,
      shopDocumentId: shopDocumentId == freezed
          ? _value.shopDocumentId
          : shopDocumentId as String,
      otp: otp == freezed ? _value.otp : otp as String,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
abstract class _$BillFreezedModelCopyWith<$Res>
    implements $BillFreezedModelCopyWith<$Res> {
  factory _$BillFreezedModelCopyWith(
          _BillFreezedModel value, $Res Function(_BillFreezedModel) then) =
      __$BillFreezedModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentId,
      String description,
      List<ItemFreezedModel> item,
      int id,
      int rewardPointsGiven,
      int redeemRewardPoints,
      bool isProcessing,
      String customerPhoneNumber,
      double amount,
      String updatedByUID,
      String customerUID,
      dynamic updatedOn,
      String shopDocumentId,
      String otp,
      String error});
}

/// @nodoc
class __$BillFreezedModelCopyWithImpl<$Res>
    extends _$BillFreezedModelCopyWithImpl<$Res>
    implements _$BillFreezedModelCopyWith<$Res> {
  __$BillFreezedModelCopyWithImpl(
      _BillFreezedModel _value, $Res Function(_BillFreezedModel) _then)
      : super(_value, (v) => _then(v as _BillFreezedModel));

  @override
  _BillFreezedModel get _value => super._value as _BillFreezedModel;

  @override
  $Res call({
    Object documentId = freezed,
    Object description = freezed,
    Object item = freezed,
    Object id = freezed,
    Object rewardPointsGiven = freezed,
    Object redeemRewardPoints = freezed,
    Object isProcessing = freezed,
    Object customerPhoneNumber = freezed,
    Object amount = freezed,
    Object updatedByUID = freezed,
    Object customerUID = freezed,
    Object updatedOn = freezed,
    Object shopDocumentId = freezed,
    Object otp = freezed,
    Object error = freezed,
  }) {
    return _then(_BillFreezedModel(
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      description:
          description == freezed ? _value.description : description as String,
      item: item == freezed ? _value.item : item as List<ItemFreezedModel>,
      id: id == freezed ? _value.id : id as int,
      rewardPointsGiven: rewardPointsGiven == freezed
          ? _value.rewardPointsGiven
          : rewardPointsGiven as int,
      redeemRewardPoints: redeemRewardPoints == freezed
          ? _value.redeemRewardPoints
          : redeemRewardPoints as int,
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      customerPhoneNumber: customerPhoneNumber == freezed
          ? _value.customerPhoneNumber
          : customerPhoneNumber as String,
      amount: amount == freezed ? _value.amount : amount as double,
      updatedByUID: updatedByUID == freezed
          ? _value.updatedByUID
          : updatedByUID as String,
      customerUID:
          customerUID == freezed ? _value.customerUID : customerUID as String,
      updatedOn: updatedOn == freezed ? _value.updatedOn : updatedOn as dynamic,
      shopDocumentId: shopDocumentId == freezed
          ? _value.shopDocumentId
          : shopDocumentId as String,
      otp: otp == freezed ? _value.otp : otp as String,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BillFreezedModel
    with DiagnosticableTreeMixin
    implements _BillFreezedModel {
  _$_BillFreezedModel(
      {this.documentId,
      this.description,
      this.item,
      this.id,
      this.rewardPointsGiven,
      this.redeemRewardPoints,
      this.isProcessing,
      this.customerPhoneNumber,
      this.amount,
      this.updatedByUID,
      this.customerUID,
      this.updatedOn,
      this.shopDocumentId,
      this.otp,
      this.error});

  factory _$_BillFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BillFreezedModelFromJson(json);

  @override
  final String documentId;
  @override
  final String description;
  @override
  final List<ItemFreezedModel> item;
  @override
  final int id;
  @override
  final int rewardPointsGiven;
  @override
  final int redeemRewardPoints;
  @override
  final bool isProcessing;
  @override
  final String customerPhoneNumber;
  @override
  final double amount;
  @override
  final String updatedByUID;
  @override
  final String customerUID;
  @override
  final dynamic updatedOn;
  @override
  final String shopDocumentId;
  @override
  final String otp;
  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BillFreezedModel(documentId: $documentId, description: $description, item: $item, id: $id, rewardPointsGiven: $rewardPointsGiven, redeemRewardPoints: $redeemRewardPoints, isProcessing: $isProcessing, customerPhoneNumber: $customerPhoneNumber, amount: $amount, updatedByUID: $updatedByUID, customerUID: $customerUID, updatedOn: $updatedOn, shopDocumentId: $shopDocumentId, otp: $otp, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BillFreezedModel'))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('item', item))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rewardPointsGiven', rewardPointsGiven))
      ..add(DiagnosticsProperty('redeemRewardPoints', redeemRewardPoints))
      ..add(DiagnosticsProperty('isProcessing', isProcessing))
      ..add(DiagnosticsProperty('customerPhoneNumber', customerPhoneNumber))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('updatedByUID', updatedByUID))
      ..add(DiagnosticsProperty('customerUID', customerUID))
      ..add(DiagnosticsProperty('updatedOn', updatedOn))
      ..add(DiagnosticsProperty('shopDocumentId', shopDocumentId))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BillFreezedModel &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.rewardPointsGiven, rewardPointsGiven) ||
                const DeepCollectionEquality()
                    .equals(other.rewardPointsGiven, rewardPointsGiven)) &&
            (identical(other.redeemRewardPoints, redeemRewardPoints) ||
                const DeepCollectionEquality()
                    .equals(other.redeemRewardPoints, redeemRewardPoints)) &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.customerPhoneNumber, customerPhoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.customerPhoneNumber, customerPhoneNumber)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.updatedByUID, updatedByUID) ||
                const DeepCollectionEquality()
                    .equals(other.updatedByUID, updatedByUID)) &&
            (identical(other.customerUID, customerUID) ||
                const DeepCollectionEquality()
                    .equals(other.customerUID, customerUID)) &&
            (identical(other.updatedOn, updatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.updatedOn, updatedOn)) &&
            (identical(other.shopDocumentId, shopDocumentId) ||
                const DeepCollectionEquality()
                    .equals(other.shopDocumentId, shopDocumentId)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(rewardPointsGiven) ^
      const DeepCollectionEquality().hash(redeemRewardPoints) ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(customerPhoneNumber) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(updatedByUID) ^
      const DeepCollectionEquality().hash(customerUID) ^
      const DeepCollectionEquality().hash(updatedOn) ^
      const DeepCollectionEquality().hash(shopDocumentId) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$BillFreezedModelCopyWith<_BillFreezedModel> get copyWith =>
      __$BillFreezedModelCopyWithImpl<_BillFreezedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BillFreezedModelToJson(this);
  }
}

abstract class _BillFreezedModel implements BillFreezedModel {
  factory _BillFreezedModel(
      {String documentId,
      String description,
      List<ItemFreezedModel> item,
      int id,
      int rewardPointsGiven,
      int redeemRewardPoints,
      bool isProcessing,
      String customerPhoneNumber,
      double amount,
      String updatedByUID,
      String customerUID,
      dynamic updatedOn,
      String shopDocumentId,
      String otp,
      String error}) = _$_BillFreezedModel;

  factory _BillFreezedModel.fromJson(Map<String, dynamic> json) =
      _$_BillFreezedModel.fromJson;

  @override
  String get documentId;
  @override
  String get description;
  @override
  List<ItemFreezedModel> get item;
  @override
  int get id;
  @override
  int get rewardPointsGiven;
  @override
  int get redeemRewardPoints;
  @override
  bool get isProcessing;
  @override
  String get customerPhoneNumber;
  @override
  double get amount;
  @override
  String get updatedByUID;
  @override
  String get customerUID;
  @override
  dynamic get updatedOn;
  @override
  String get shopDocumentId;
  @override
  String get otp;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$BillFreezedModelCopyWith<_BillFreezedModel> get copyWith;
}
