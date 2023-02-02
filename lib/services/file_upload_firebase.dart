import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:go_blog/services/file_upload.dart';
import 'package:go_blog/models/async_message.dart';

class FileUploadFirebase implements FileUpload {
  final Reference _ref = FirebaseStorage.instance.ref();
  @override
  Future<AsyncMessage> multi(List<File> files) async {
    return AsyncMessage(isSuccess: false, message: 'not implemented');
  }

  @override
  Future<AsyncMessage> single({
    required File file,
    required String foldername,
    required String filename,
  }) async {
    try {
      final Reference path = _ref.child('$foldername/$filename');
      final UploadTask uploadTask = path.putFile(file);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return AsyncMessage(
        isSuccess: true,
        message: downloadUrl,
      );
    } catch (e) {
      return AsyncMessage(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
