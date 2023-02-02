import 'dart:io';
import 'package:go_blog/models/async_message.dart';

abstract class FileUpload {
  Future<AsyncMessage> single({
    required File file,
    required String foldername,
    required String filename,
  });
  Future<AsyncMessage> multi(List<File> files);
}
