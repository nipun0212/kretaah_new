// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CreateItemStateTearOff {
  const _$CreateItemStateTearOff();

// ignore: unused_element
  _Item call(
      {String name,
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
      String error}) {
    return _Item(
      name: name,
      description: description,
      gst: gst,
      rate: rate,
      cgst: cgst,
      sgst: sgst,
      utgst: utgst,
      igst: igst,
      quantity: quantity,
      rateAfterGST: rateAfterGST,
      totalAmount: totalAmount,
      totalGST: totalGST,
      error: error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CreateItemState = _$CreateItemStateTearOff();

/// @nodoc
mixin _$CreateItemState {
  String get name;
  String get description;
  String get gst;
  double get rate;
  double get cgst;
  double get sgst;
  double get utgst;
  double get igst;
  int get quantity;
  double get rateAfterGST;
  double get totalAmount;
  double get totalGST;
  String get error;

  @JsonKey(ignore: true)
  $CreateItemStateCopyWith<CreateItemState> get copyWith;
}

/// @nodoc
abstract class $CreateItemStateCopyWith<$Res> {
  factory $CreateItemStateCopyWith(
          CreateItemState value, $Res Function(CreateItemState) then) =
      _$CreateItemStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
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
      String error});
}

/// @nodoc
class _$CreateItemStateCopyWithImpl<$Res>
    implements $CreateItemStateCopyWith<$Res> {
  _$CreateItemStateCopyWithImpl(this._value, this._then);

  final CreateItemState _value;
  // ignore: unused_field
  final $Res Function(CreateItemState) _then;

  @override
  $Res call({
    Object name = freezed,
    Object description = freezed,
    Object gst = freezed,
    Object rate = freezed,
    Object cgst = freezed,
    Object sgst = freezed,
    Object utgst = freezed,
    Object igst = freezed,
    Object quantity = freezed,
    Object rateAfterGST = freezed,
    Object totalAmount = freezed,
    Object totalGST = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      gst: gst == freezed ? _value.gst : gst as String,
      rate: rate == freezed ? _value.rate : rate as double,
      cgst: cgst == freezed ? _value.cgst : cgst as double,
      sgst: sgst == freezed ? _value.sgst : sgst as double,
      utgst: utgst == freezed ? _value.utgst : utgst as double,
      igst: igst == freezed ? _value.igst : igst as double,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
      rateAfterGST: rateAfterGST == freezed
          ? _value.rateAfterGST
          : rateAfterGST as double,
      totalAmount:
          totalAmount == freezed ? _value.totalAmount : totalAmount as double,
      totalGST: totalGST == freezed ? _value.totalGST : totalGST as double,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $CreateItemStateCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
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
      String error});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$CreateItemStateCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object name = freezed,
    Object description = freezed,
    Object gst = freezed,
    Object rate = freezed,
    Object cgst = freezed,
    Object sgst = freezed,
    Object utgst = freezed,
    Object igst = freezed,
    Object quantity = freezed,
    Object rateAfterGST = freezed,
    Object totalAmount = freezed,
    Object totalGST = freezed,
    Object error = freezed,
  }) {
    return _then(_Item(
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      gst: gst == freezed ? _value.gst : gst as String,
      rate: rate == freezed ? _value.rate : rate as double,
      cgst: cgst == freezed ? _value.cgst : cgst as double,
      sgst: sgst == freezed ? _value.sgst : sgst as double,
      utgst: utgst == freezed ? _value.utgst : utgst as double,
      igst: igst == freezed ? _value.igst : igst as double,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
      rateAfterGST: rateAfterGST == freezed
          ? _value.rateAfterGST
          : rateAfterGST as double,
      totalAmount:
          totalAmount == freezed ? _value.totalAmount : totalAmount as double,
      totalGST: totalGST == freezed ? _value.totalGST : totalGST as double,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
class _$_Item implements _Item {
  _$_Item(
      {this.name,
      this.description,
      this.gst,
      this.rate,
      this.cgst,
      this.sgst,
      this.utgst,
      this.igst,
      this.quantity,
      this.rateAfterGST,
      this.totalAmount,
      this.totalGST,
      this.error});

  @override
  final String name;
  @override
  final String description;
  @override
  final String gst;
  @override
  final double rate;
  @override
  final double cgst;
  @override
  final double sgst;
  @override
  final double utgst;
  @override
  final double igst;
  @override
  final int quantity;
  @override
  final double rateAfterGST;
  @override
  final double totalAmount;
  @override
  final double totalGST;
  @override
  final String error;

  @override
  String toString() {
    return 'CreateItemState(name: $name, description: $description, gst: $gst, rate: $rate, cgst: $cgst, sgst: $sgst, utgst: $utgst, igst: $igst, quantity: $quantity, rateAfterGST: $rateAfterGST, totalAmount: $totalAmount, totalGST: $totalGST, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.gst, gst) ||
                const DeepCollectionEquality().equals(other.gst, gst)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.cgst, cgst) ||
                const DeepCollectionEquality().equals(other.cgst, cgst)) &&
            (identical(other.sgst, sgst) ||
                const DeepCollectionEquality().equals(other.sgst, sgst)) &&
            (identical(other.utgst, utgst) ||
                const DeepCollectionEquality().equals(other.utgst, utgst)) &&
            (identical(other.igst, igst) ||
                const DeepCollectionEquality().equals(other.igst, igst)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.rateAfterGST, rateAfterGST) ||
                const DeepCollectionEquality()
                    .equals(other.rateAfterGST, rateAfterGST)) &&
            (identical(other.totalAmount, totalAmount) ||
                const DeepCollectionEquality()
                    .equals(other.totalAmount, totalAmount)) &&
            (identical(other.totalGST, totalGST) ||
                const DeepCollectionEquality()
                    .equals(other.totalGST, totalGST)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(gst) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(cgst) ^
      const DeepCollectionEquality().hash(sgst) ^
      const DeepCollectionEquality().hash(utgst) ^
      const DeepCollectionEquality().hash(igst) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(rateAfterGST) ^
      const DeepCollectionEquality().hash(totalAmount) ^
      const DeepCollectionEquality().hash(totalGST) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);
}

abstract class _Item implements CreateItemState {
  factory _Item(
      {String name,
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
      String error}) = _$_Item;

  @override
  String get name;
  @override
  String get description;
  @override
  String get gst;
  @override
  double get rate;
  @override
  double get cgst;
  @override
  double get sgst;
  @override
  double get utgst;
  @override
  double get igst;
  @override
  int get quantity;
  @override
  double get rateAfterGST;
  @override
  double get totalAmount;
  @override
  double get totalGST;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith;
}
