// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shop_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ShopFreezedModel _$ShopFreezedModelFromJson(Map<String, dynamic> json) {
  return _ShopFreezedModel.fromJson(json);
}

/// @nodoc
class _$ShopFreezedModelTearOff {
  const _$ShopFreezedModelTearOff();

// ignore: unused_element
  _ShopFreezedModel call(
      {String documentId,
      int id,
      bool isProcessing,
      String shopName,
      String ownerName,
      String ownerPhoneNumber,
      String ownerUID,
      bool isShopActive,
      AddressFreezedModel address}) {
    return _ShopFreezedModel(
      documentId: documentId,
      id: id,
      isProcessing: isProcessing,
      shopName: shopName,
      ownerName: ownerName,
      ownerPhoneNumber: ownerPhoneNumber,
      ownerUID: ownerUID,
      isShopActive: isShopActive,
      address: address,
    );
  }

// ignore: unused_element
  ShopFreezedModel fromJson(Map<String, Object> json) {
    return ShopFreezedModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ShopFreezedModel = _$ShopFreezedModelTearOff();

/// @nodoc
mixin _$ShopFreezedModel {
  String get documentId;
  int get id;
  bool get isProcessing;
  String get shopName;
  String get ownerName;
  String get ownerPhoneNumber;
  String get ownerUID;
  bool get isShopActive;
  AddressFreezedModel get address;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ShopFreezedModelCopyWith<ShopFreezedModel> get copyWith;
}

/// @nodoc
abstract class $ShopFreezedModelCopyWith<$Res> {
  factory $ShopFreezedModelCopyWith(
          ShopFreezedModel value, $Res Function(ShopFreezedModel) then) =
      _$ShopFreezedModelCopyWithImpl<$Res>;
  $Res call(
      {String documentId,
      int id,
      bool isProcessing,
      String shopName,
      String ownerName,
      String ownerPhoneNumber,
      String ownerUID,
      bool isShopActive,
      AddressFreezedModel address});

  $AddressFreezedModelCopyWith<$Res> get address;
}

/// @nodoc
class _$ShopFreezedModelCopyWithImpl<$Res>
    implements $ShopFreezedModelCopyWith<$Res> {
  _$ShopFreezedModelCopyWithImpl(this._value, this._then);

  final ShopFreezedModel _value;
  // ignore: unused_field
  final $Res Function(ShopFreezedModel) _then;

  @override
  $Res call({
    Object documentId = freezed,
    Object id = freezed,
    Object isProcessing = freezed,
    Object shopName = freezed,
    Object ownerName = freezed,
    Object ownerPhoneNumber = freezed,
    Object ownerUID = freezed,
    Object isShopActive = freezed,
    Object address = freezed,
  }) {
    return _then(_value.copyWith(
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      id: id == freezed ? _value.id : id as int,
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      shopName: shopName == freezed ? _value.shopName : shopName as String,
      ownerName: ownerName == freezed ? _value.ownerName : ownerName as String,
      ownerPhoneNumber: ownerPhoneNumber == freezed
          ? _value.ownerPhoneNumber
          : ownerPhoneNumber as String,
      ownerUID: ownerUID == freezed ? _value.ownerUID : ownerUID as String,
      isShopActive:
          isShopActive == freezed ? _value.isShopActive : isShopActive as bool,
      address:
          address == freezed ? _value.address : address as AddressFreezedModel,
    ));
  }

  @override
  $AddressFreezedModelCopyWith<$Res> get address {
    if (_value.address == null) {
      return null;
    }
    return $AddressFreezedModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$ShopFreezedModelCopyWith<$Res>
    implements $ShopFreezedModelCopyWith<$Res> {
  factory _$ShopFreezedModelCopyWith(
          _ShopFreezedModel value, $Res Function(_ShopFreezedModel) then) =
      __$ShopFreezedModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentId,
      int id,
      bool isProcessing,
      String shopName,
      String ownerName,
      String ownerPhoneNumber,
      String ownerUID,
      bool isShopActive,
      AddressFreezedModel address});

  @override
  $AddressFreezedModelCopyWith<$Res> get address;
}

/// @nodoc
class __$ShopFreezedModelCopyWithImpl<$Res>
    extends _$ShopFreezedModelCopyWithImpl<$Res>
    implements _$ShopFreezedModelCopyWith<$Res> {
  __$ShopFreezedModelCopyWithImpl(
      _ShopFreezedModel _value, $Res Function(_ShopFreezedModel) _then)
      : super(_value, (v) => _then(v as _ShopFreezedModel));

  @override
  _ShopFreezedModel get _value => super._value as _ShopFreezedModel;

  @override
  $Res call({
    Object documentId = freezed,
    Object id = freezed,
    Object isProcessing = freezed,
    Object shopName = freezed,
    Object ownerName = freezed,
    Object ownerPhoneNumber = freezed,
    Object ownerUID = freezed,
    Object isShopActive = freezed,
    Object address = freezed,
  }) {
    return _then(_ShopFreezedModel(
      documentId:
          documentId == freezed ? _value.documentId : documentId as String,
      id: id == freezed ? _value.id : id as int,
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      shopName: shopName == freezed ? _value.shopName : shopName as String,
      ownerName: ownerName == freezed ? _value.ownerName : ownerName as String,
      ownerPhoneNumber: ownerPhoneNumber == freezed
          ? _value.ownerPhoneNumber
          : ownerPhoneNumber as String,
      ownerUID: ownerUID == freezed ? _value.ownerUID : ownerUID as String,
      isShopActive:
          isShopActive == freezed ? _value.isShopActive : isShopActive as bool,
      address:
          address == freezed ? _value.address : address as AddressFreezedModel,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_ShopFreezedModel
    with DiagnosticableTreeMixin
    implements _ShopFreezedModel {
  _$_ShopFreezedModel(
      {this.documentId,
      this.id,
      this.isProcessing,
      this.shopName,
      this.ownerName,
      this.ownerPhoneNumber,
      this.ownerUID,
      this.isShopActive,
      this.address});

  factory _$_ShopFreezedModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ShopFreezedModelFromJson(json);

  @override
  final String documentId;
  @override
  final int id;
  @override
  final bool isProcessing;
  @override
  final String shopName;
  @override
  final String ownerName;
  @override
  final String ownerPhoneNumber;
  @override
  final String ownerUID;
  @override
  final bool isShopActive;
  @override
  final AddressFreezedModel address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShopFreezedModel(documentId: $documentId, id: $id, isProcessing: $isProcessing, shopName: $shopName, ownerName: $ownerName, ownerPhoneNumber: $ownerPhoneNumber, ownerUID: $ownerUID, isShopActive: $isShopActive, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShopFreezedModel'))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isProcessing', isProcessing))
      ..add(DiagnosticsProperty('shopName', shopName))
      ..add(DiagnosticsProperty('ownerName', ownerName))
      ..add(DiagnosticsProperty('ownerPhoneNumber', ownerPhoneNumber))
      ..add(DiagnosticsProperty('ownerUID', ownerUID))
      ..add(DiagnosticsProperty('isShopActive', isShopActive))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShopFreezedModel &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.shopName, shopName) ||
                const DeepCollectionEquality()
                    .equals(other.shopName, shopName)) &&
            (identical(other.ownerName, ownerName) ||
                const DeepCollectionEquality()
                    .equals(other.ownerName, ownerName)) &&
            (identical(other.ownerPhoneNumber, ownerPhoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.ownerPhoneNumber, ownerPhoneNumber)) &&
            (identical(other.ownerUID, ownerUID) ||
                const DeepCollectionEquality()
                    .equals(other.ownerUID, ownerUID)) &&
            (identical(other.isShopActive, isShopActive) ||
                const DeepCollectionEquality()
                    .equals(other.isShopActive, isShopActive)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(shopName) ^
      const DeepCollectionEquality().hash(ownerName) ^
      const DeepCollectionEquality().hash(ownerPhoneNumber) ^
      const DeepCollectionEquality().hash(ownerUID) ^
      const DeepCollectionEquality().hash(isShopActive) ^
      const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$ShopFreezedModelCopyWith<_ShopFreezedModel> get copyWith =>
      __$ShopFreezedModelCopyWithImpl<_ShopFreezedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShopFreezedModelToJson(this);
  }
}

abstract class _ShopFreezedModel implements ShopFreezedModel {
  factory _ShopFreezedModel(
      {String documentId,
      int id,
      bool isProcessing,
      String shopName,
      String ownerName,
      String ownerPhoneNumber,
      String ownerUID,
      bool isShopActive,
      AddressFreezedModel address}) = _$_ShopFreezedModel;

  factory _ShopFreezedModel.fromJson(Map<String, dynamic> json) =
      _$_ShopFreezedModel.fromJson;

  @override
  String get documentId;
  @override
  int get id;
  @override
  bool get isProcessing;
  @override
  String get shopName;
  @override
  String get ownerName;
  @override
  String get ownerPhoneNumber;
  @override
  String get ownerUID;
  @override
  bool get isShopActive;
  @override
  AddressFreezedModel get address;
  @override
  @JsonKey(ignore: true)
  _$ShopFreezedModelCopyWith<_ShopFreezedModel> get copyWith;
}
