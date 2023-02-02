import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:go_blog/models/blog_model.dart';
import 'package:go_blog/services/local_data_service.dart';

class HomeController extends ChangeNotifier {
  String name = '';
  String username = '';

  getName() async {
    name = await LocalDataService.getName();
    notifyListeners();
  }

  getUsername() async {
    username = await LocalDataService.getUsername();

    notifyListeners();
  }

  Future<List<BlogModel>> getPosts() async {
    final CollectionReference<Map<String, dynamic>> postsCollection =
        FirebaseFirestore.instance.collection('posts');
    QuerySnapshot<Map<String, dynamic>> snapshot = await postsCollection.get();
    return snapshot.docs.map((e) => BlogModel.fromMap(e.data())).toList();
  }
}
