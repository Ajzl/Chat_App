import 'package:flutter/cupertino.dart';

import '../login/login_screen.dart';

class Login_Provider extends ChangeNotifier {
  bool _isSignUp = false;
  bool _isLoading = false;
  bool get isSignUp => _isSignUp;
  bool get isLoading => _isLoading;

  void loginSwitch() {
    _isSignUp = !_isSignUp;
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
