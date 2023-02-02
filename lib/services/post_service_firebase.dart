import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_blog/models/blog_model.dart';
import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/services/file_upload.dart';
import 'package:go_blog/services/file_upload_firebase.dart';
import 'dart:io';

import 'package:go_blog/services/post_service.dart';

class PostServiceFirebase implements PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<AsyncMessage> post(BlogModel blog, File image) async {
    try {
      final FileUpload uploadThumb = FileUploadFirebase();
      final AsyncMessage uploadResult = await uploadThumb.single(
        file: image,
        foldername: 'thumb_img',
        filename: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      if (uploadResult.isSuccess == false) {
        return AsyncMessage(isSuccess: false, message: 'file upload failed');
      }

      await _firestore
          .collection('posts')
          .doc()
          .set(blog.toMap(uploadResult.message));

      return AsyncMessage(
        isSuccess: true,
        message: 'Blog posted successfully',
      );
    } catch (e) {
      return AsyncMessage(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
