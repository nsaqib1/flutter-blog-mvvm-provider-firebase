import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_blog/models/async_message.dart';
import 'package:go_blog/models/local_user_dara.dart';
import 'package:go_blog/models/login_model.dart';
import 'package:go_blog/models/signup_model.dart';
import 'package:go_blog/services/auth_service.dart';
import 'package:go_blog/services/file_upload.dart';
import 'package:go_blog/services/file_upload_firebase.dart';
import 'package:go_blog/services/local_data_service.dart';

class AuthServiceFirebase implements AuthService {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<AsyncMessage> login(LoginModel user) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore.collection('users').doc(cred.user!.uid).get();

      String name = userData.data()!['name'];
      String username = userData.data()!['username'];
      LocalDataService.setUser(
        LocalUserData(
          name: name,
          username: username,
        ),
      );
      return AsyncMessage(
        isSuccess: true,
        message: 'Successfull Logged in',
      );
    } catch (e) {
      return AsyncMessage(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }

  @override
  logout() {
    _auth.signOut();
  }

  @override
  bool loginStatus() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<AsyncMessage> signUp(SignupModel user, File image) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final FileUpload uploadProfile = FileUploadFirebase();
      final AsyncMessage uploadResult = await uploadProfile.single(
        file: image,
        foldername: 'profile_img',
        filename: cred.user!.uid,
      );

      if (uploadResult.isSuccess) {
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson(uploadResult.message));

        LocalDataService.setUser(
          LocalUserData(
            name: user.name,
            username: user.username,
          ),
        );

        return AsyncMessage(
          isSuccess: true,
          message: 'Success',
        );
      } else {
        throw Exception('File Upload Failed');
      }
    } catch (e) {
      return AsyncMessage(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
