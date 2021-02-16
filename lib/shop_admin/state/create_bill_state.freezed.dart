// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_bill_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CreateBillStateTearOff {
  const _$CreateBillStateTearOff();

// ignore: unused_element
  _Bill call(
      {String documentId,
      String description,
      List<CreateItemState> item,
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
    return _Bill(
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
}

/// @nodoc
// ignore: unused_element
const $CreateBillState = _$CreateBillStateTearOff();

/// @nodoc
mixin _$CreateBillState {
  String get documentId;
  String get description;
  List<CreateItemState> get item;
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

  @JsonKey(ignore: true)
  $CreateBillStateCopyWith<CreateBillState> get copyWith;
}

/// @nodoc
abstract class $CreateBillStateCopyWith<$Res> {
  factory $CreateBillStateCopyWith(
          CreateBillState value, $Res Function(CreateBillState) then) =
      _$CreateBillStateCopyWithImpl<$Res>;
  $Res call(
      {String documentId,
      String description,
      List<CreateItemState> item,
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
class _$CreateBillStateCopyWithImpl<$Res>
    implements $CreateBillStateCopyWith<$Res> {
  _$CreateBillStateCopyWithImpl(this._value, this._then);

  final CreateBillState _value;
  // ignore: unused_field
  final $Res Function(CreateBillState) _then;

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
      item: item == freezed ? _value.item : item as List<CreateItemState>,
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
abstract class _$BillCopyWith<$Res> implements $CreateBillStateCopyWith<$Res> {
  factory _$BillCopyWith(_Bill value, $Res Function(_Bill) then) =
      __$BillCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentId,
      String description,
      List<CreateItemState> item,
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
class __$BillCopyWithImpl<$Res> extends _$CreateBillStateCopyWithImpl<$Res>
    implements _$BillCopyWith<$Res> {
  __$BillCopyWithImpl(_Bill _value, $Res Function(_Bill) _then)
      : super(_value, (v) => _then(v as _Bill));

  @override
  _Bill get _value => super._value as _Bill;

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
    return _then(_Bill(
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      description:
          description == freezed ? _value.description : description as String,
      item: item == freezed ? _value.item : item as List<CreateItemState>,
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
class _$_Bill with DiagnosticableTreeMixin implements _Bill {
  const _$_Bill(
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

  @override
  final String documentId;
  @override
  final String description;
  @override
  final List<CreateItemState> item;
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
    return 'CreateBillState(documentId: $documentId, description: $description, item: $item, id: $id, rewardPointsGiven: $rewardPointsGiven, redeemRewardPoints: $redeemRewardPoints, isProcessing: $isProcessing, customerPhoneNumber: $customerPhoneNumber, amount: $amount, updatedByUID: $updatedByUID, customerUID: $customerUID, updatedOn: $updatedOn, shopDocumentId: $shopDocumentId, otp: $otp, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateBillState'))
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
        (other is _Bill &&
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
  _$BillCopyWith<_Bill> get copyWith =>
      __$BillCopyWithImpl<_Bill>(this, _$identity);
}

abstract class _Bill implements CreateBillState {
  const factory _Bill(
      {String documentId,
      String description,
      List<CreateItemState> item,
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
      String error}) = _$_Bill;

  @override
  String get documentId;
  @override
  String get description;
  @override
  List<CreateItemState> get item;
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
  _$BillCopyWith<_Bill> get copyWith;
}
