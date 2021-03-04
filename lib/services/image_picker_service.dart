import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  // Returns a [File] object pointing to the image that was picked.
  Future<PickedFile?> pickImage({required ImageSource source}) async {
    final _picker = ImagePicker();
    return await _picker.getImage(source: source);
  }
}
