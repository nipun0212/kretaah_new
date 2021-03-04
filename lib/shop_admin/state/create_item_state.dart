import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_item_state.freezed.dart';
// part 'create_item_state.g.dart';

@freezed
abstract class CreateItemState with _$CreateItemState {
  // const factory CreateItemState.noError() = _NoError;
  // const factory CreateItemState.error(String errorText) = _Error;
  // const factory CreateItemState.loading() = _Loading;
  factory CreateItemState({
    String? name,
    String? description,
    String? gst,
    double? rate,
    double? cgst,
    double? sgst,
    double? utgst,
    double? igst,
    int? quantity,
    double? rateAfterGST,
    double? totalAmount,
    double? totalGST,
    String? error,
  }) = _Item;

  // factory CreateItemState.fromJson(Map<String, dynamic> json) =>
  //     _$CreateItemStateFromJson(json);
}
