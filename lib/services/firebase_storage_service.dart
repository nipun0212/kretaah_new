import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:kretaa/services/api_path.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FirebaseStorageService {
  FirebaseStorageService({required this.uid}) : assert(uid != null);
  final String uid;
  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    print('file path is ${file.path}');
    print('file absolute path is ${file.absolute.path}');
    // print('file path is ${file.path}');
    var result = await (FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 88,
      // rotate: 180,
    ) as FutureOr<File>);

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }

  /// Upload an avatar from file
  Future<String> uploadAvatar({
    required File file,
  }) async =>
      await upload(
        file: await testCompressAndGetFile(file, file.path + 'new.jpeg'),
        path: StoragePath.profilePhoto(uid),
        // contentType: 'image/png',
      );

  /// Generic file upload for any [path] and [contentType]
  Future<String> upload({
    required File file,
    required String path,
    // @required String contentType,
  }) async {
    print('uploading to: $path');
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(file, null);
    final snapshot = await uploadTask.whenComplete(() => null);
    if (snapshot.state == TaskState.error) {
      print('upload error code: $snapshot');
      throw snapshot;
    }
    // Url used to download file/image
    final downloadUrl = await snapshot.ref.getDownloadURL();
    print('downloadUrl: $downloadUrl');
    return downloadUrl;
  }
}
