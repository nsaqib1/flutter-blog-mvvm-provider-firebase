import 'package:go_blog/models/local_user_dara.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataService {
  static setUser(LocalUserData user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', user.name);
    prefs.setString('username', user.username);
  }

  static Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? '';
  }

  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }
}
