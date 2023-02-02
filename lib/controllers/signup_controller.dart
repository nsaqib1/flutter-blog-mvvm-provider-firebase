import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_blog/controllers/app_controller.dart';
import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/models/signup_model.dart';
import 'package:go_blog/services/auth_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignupController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  File? image;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  get nameController => _nameController;
  get usernameController => _usernameController;
  get emailController => _emailController;
  get password1Controller => _password1Controller;
  get password2Controller => _password2Controller;

  onPickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xfile == null) {
      return;
    }
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: xfile.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      cropStyle: CropStyle.circle,
    );
    if (cropped == null) {
      return;
    }
    image = File(cropped.path);
    notifyListeners();
  }

  onSignup(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (_nameController.text.isEmpty) {
      snacbar(context, 'Name is required');
      return;
    }

    if (_usernameController.text.isEmpty) {
      snacbar(context, 'Username is required');
      return;
    }

    if (_emailController.text.isEmpty) {
      snacbar(context, 'Email is required');
      return;
    }

    if (_password1Controller.text != _password2Controller.text) {
      snacbar(context, 'Password did not match');
      return;
    }

    if (image == null) {
      snacbar(context, 'Select a Profile photo');
      return;
    }

    isLoading = true;
    notifyListeners();

    // ignore: use_build_context_synchronously
    final AppController appController = context.read<AppController>();
    AsyncMessage result = await appController.auth.signUp(
      SignupModel(
        name: _nameController.text,
        email: _emailController.text,
        password: _password1Controller.text,
        username: _usernameController.text,
      ),
      image!,
    );

    isLoading = false;
    notifyListeners();

    if (result.isSuccess) {
      appController.changeLogginStatus(true);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } else {
      // ignore: use_build_context_synchronously
      snacbar(context, result.message);
      return;
    }
  }

  snacbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepOrange,
        content: Text(message),
      ),
    );
  }
}
