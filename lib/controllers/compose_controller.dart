import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/models/blog_model.dart';
import 'package:go_blog/services/post_service.dart';
import 'package:go_blog/services/post_service_firebase.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ComposeController extends ChangeNotifier {
  bool isLoading = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  get titleController => _titleController;
  get categoryController => _categoryController;
  get contentController => _contentController;

  File? image;

  onPickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xfile == null) {
      return;
    }
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: xfile.path,
      aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
    );
    if (cropped == null) {
      return;
    }
    image = File(cropped.path);
    notifyListeners();
  }

  onPost(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (image == null) {
      showSnackbar(context, 'Thumbnail is required');
      return;
    }
    if (_titleController.text.isEmpty) {
      showSnackbar(context, 'Title is required');
      return;
    }
    if (_categoryController.text.isEmpty) {
      showSnackbar(context, 'Category is required');
      return;
    }
    if (_contentController.text.isEmpty) {
      showSnackbar(context, 'Content is required');
      return;
    }

    isLoading = true;
    notifyListeners();

    PostService postService = PostServiceFirebase();
    AsyncMessage result = await postService.post(
      BlogModel(
        title: _titleController.text,
        category: _categoryController.text,
        content: _contentController.text,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
      image!,
    );

    isLoading = false;
    notifyListeners();

    if (result.isSuccess) {
      // ignore: use_build_context_synchronously
      showSnackbar(context, 'posted successfullt', true);
      image = null;
      _titleController.text = '';
      _categoryController.text = '';
      _contentController.text = '';
      notifyListeners();
    }
  }
}

void showSnackbar(BuildContext context, String msg, [bool success = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: success ? Colors.green : Colors.red,
      content: Text(msg),
    ),
  );
}
