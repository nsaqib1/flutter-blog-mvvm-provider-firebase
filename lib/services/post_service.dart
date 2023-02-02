import 'dart:io';

import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/models/blog_model.dart';
import 'package:go_blog/models/signup_model.dart';

abstract class PostService {
  Future<AsyncMessage> post(BlogModel blog, File image);
}
