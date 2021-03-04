import 'package:meta/meta.dart';

class Gst {
  Map<String, int>? _gst_options;
  Gst() {
    this._gst_options = {'gst_0': 0, 'gst_5': 5};
  }
  Map<String, int>? get gst_options => _gst_options;
}
