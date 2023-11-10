import 'package:flutter/cupertino.dart';

import '../login/login_screen.dart';

class Login_Provider extends ChangeNotifier{
  bool _isSignUp=false;
  bool get isSignUp => _isSignUp;

  void loginSwitch(){
    _isSignUp=!_isSignUp;
    notifyListeners();
  }

}