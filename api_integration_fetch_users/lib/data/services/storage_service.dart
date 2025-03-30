import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class StorageService {
  static const String _userNameKey = 'saved_user_name';
  static const String _userEmailKey = 'saved_user_email';
  static const String _userIdKey = 'saved_user_id';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, user.id); 
    await prefs.setString(_userNameKey, user.name);
    await prefs.setString(_userEmailKey, user.email);
  }

  Future<User?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt(_userIdKey);
    final String? name = prefs.getString(_userNameKey);
    final String? email = prefs.getString(_userEmailKey);

    if (id != null && name != null && email != null) {
      return User(id: id, name: name, email: email);
    }
    return null;
  }

  Future<void> clearSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);
  }
}