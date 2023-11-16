import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
}
