import 'package:freezed_annotation/freezed_annotation.dart';

part 'gst_state.freezed.dart';
part 'gst_state.g.dart';

@freezed
abstract class GSTState with _$GSTState {
  // const factory CreateItemState.noError() = _NoError;
  // const factory CreateItemState.error(String errorText) = _Error;
  // const factory CreateItemState.loading() = _Loading;
  factory GSTState({String name, int percentage}) = _Gst;

  factory GSTState.fromJson(Map<String, dynamic> json) =>
      _$GSTStateFromJson(json);
}
